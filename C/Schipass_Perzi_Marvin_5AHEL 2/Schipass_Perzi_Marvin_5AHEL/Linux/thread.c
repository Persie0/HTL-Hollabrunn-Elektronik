#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <mysql/mysql.h>
#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>

#define MAXLINE 4096



void create_database(void)
{
    MYSQL *mysql;
    char query[MAXLINE];

    mysql = mysql_init(NULL);
    if (!mysql_real_connect(mysql, "localhost", "root", "",
        NULL, 0, NULL, 0)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "CREATE DATABASE IF NOT EXISTS fsst");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "USE fsst");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "CREATE TABLE IF NOT EXISTS Skicardevent (Skicardnr varchar(255), Timest timestamp)");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "CREATE TABLE IF NOT EXISTS Wettermessung (Temperatur varchar(255), Ort varchar(255), Timest timestamp)");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    mysql_close(mysql);
}

void save_weather_data(char *weather_data, char *location)
{
    char query[MAXLINE];
    MYSQL *mysql;
    mysql = mysql_init(NULL);
    if (!mysql_real_connect(mysql, "localhost", "root", "pw",
        NULL, 0, NULL, 0)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "USE fsst");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "INSERT INTO Wettermessung (Temperatur, Ort, Timest) VALUES('%s', '%s', CURRENT_TIMESTAMP())", weather_data, location);
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    mysql_close(mysql);
}

void save_uuid(char *uuid)
{
    char query[MAXLINE];
    MYSQL *mysql;

    mysql = mysql_init(NULL);
    if (!mysql_real_connect(mysql, "localhost", "root", "pw",
        NULL, 0, NULL, 0)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "USE fsst");
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    sprintf(query, "INSERT INTO Skicardevent (Skicardnr, Timest) VALUES('%s', CURRENT_TIMESTAMP())", uuid);
    if (mysql_query(mysql, query)) {
        fprintf(stderr, "%s\n", mysql_error(mysql));
        exit(1);
    }

    mysql_close(mysql);
}

void get_weather_data(char *location, char *api_key, char *temperature)
{
    // Create the socket
    int sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0) {
        printf("Failed to create socket\n");
        return;
    }
    char *ip;
    struct hostent *he;
    struct in_addr **addr_list;
    he = gethostbyname("api.openweathermap.org");
    addr_list = (struct in_addr **) he->h_addr_list;
    ip = inet_ntoa(*addr_list[0]);

    // Build the request string
    char request[256];
    sprintf(request, "GET /data/2.5/weather?q=%s&appid=%s&units=metric HTTP/1.1\nHost: api.openweathermap.org\n\n", location, api_key);

    // Connect to the server
    struct sockaddr_in serv_addr;
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(80);
    serv_addr.sin_addr.s_addr = inet_addr(ip);
    int res = connect(sockfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    if (res < 0) {
        printf("Failed to connect to server\n");
        return;
    }

    // Send the request
    if (send(sockfd, request, strlen(request), 0) < 0) {
        printf("Failed to send request\n");
        return;
    }

    // Receive the response
    char response[1024];
    if (recv(sockfd, response, sizeof(response), 0) < 0) {
        printf("Failed to receive response\n");
        return;
    }

     // Parse the response to get the temperature
    char *p = strstr(response, "\"temp\":");
    char *q = p + strlen("\"temp\":");
    char *r = strstr(q, ",\"feels_like");
    strncpy(temperature, q, r-q);
    printf(temperature);

    // Close the socket
    close(sockfd);

}

void get_uuid(char *uuid)
{
    FILE *fp;
    char *line = NULL;
    size_t len = 0;
    ssize_t read;

    fp = fopen("/proc/sys/kernel/random/uuid", "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);

    while ((read = getline(&line, &len, fp)) != -1) {
        line[read - 1] = '\0'; //remove \n from getline
        strcpy(uuid, line);
    }
    fclose(fp);
    if (line)
        free(line);
}

void *thread_uuid(void *arg)
{
    char uuid[MAXLINE];
    int i = 0;
    while(1) {
        get_uuid(uuid);
        save_uuid(uuid);
        printf("%d: %s", i, uuid);
        i++;
        sleep(10);
    }
}

void *thread_weather(void *arg)
{
    char temperature[MAXLINE];
    int i = 0;
    while(1) {
        char location[50]="Hollabrunn";
        get_weather_data(location, "1f951a88b22180d9d43ba853202767e8", temperature);
        save_weather_data(temperature, location);
        printf("%d: %s", i, temperature);
        i++;
        sleep(30);
    }
}

int main(int argc, char **argv)
{
    pthread_t tid_uuid, tid_weather;
    int err;

    create_database();

    err = pthread_create(&tid_uuid, NULL, thread_uuid, NULL);
    if (err != 0)
        printf("can't create thread: %s\n", strerror(err));

    err = pthread_create(&tid_weather, NULL, thread_weather, NULL);
    if (err != 0)
        printf("can't create thread: %s\n", strerror(err));

    pthread_join(tid_uuid, NULL);
    pthread_join(tid_weather, NULL);

    return 0;
}
