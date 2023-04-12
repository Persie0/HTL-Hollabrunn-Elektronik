
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

// mutexes A-F as PTHREAD_MUTEX_INITIALIZER (do not need to be initialized)
pthread_mutex_t mutexA = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutexB = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutexC = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutexD = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutexE = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutexF = PTHREAD_MUTEX_INITIALIZER;

// time variables for time elapsed
time_t start, end, end2;

// function to delay and unlock a mutex
void delay_and_unlock_mutex(pthread_mutex_t *mutex, char *process_name)
{
    // delay for a random amount of time between 2 and 6 seconds
    int delay = rand() % 5 + 2;
    // get the current time
    time(&end);
    printf("%f seconds elapsed; %s is sleeping for %d seconds \n", difftime(end, start), process_name, delay);
    // sleep for the random amount of time
    sleep(delay);
    // unlock the current mutex
    pthread_mutex_unlock(mutex);
    // get the current time
    time(&end2);
    printf("%s is done in %f seconds \n", process_name, difftime(end2, start));
}

// process A
void *processA(void *arg)
{
    delay_and_unlock_mutex(&mutexA, "Process A");
    return NULL;
}

// process B
void *processB(void *arg)
{
    delay_and_unlock_mutex(&mutexB, "Process B");
    return NULL;
}

// process C
void *processC(void *arg)
{
    // wait for mutex A and B to be unlocked
    pthread_mutex_lock(&mutexA);
    pthread_mutex_unlock(&mutexA);
    pthread_mutex_lock(&mutexB);
    pthread_mutex_unlock(&mutexB);
    delay_and_unlock_mutex(&mutexC, "Process C");
    return NULL;
}

// process D
void *processD(void *arg)
{
    // wait for mutex A and C to be unlocked
    pthread_mutex_lock(&mutexA);
    pthread_mutex_unlock(&mutexA);
    pthread_mutex_lock(&mutexC);
    pthread_mutex_unlock(&mutexC);
    delay_and_unlock_mutex(&mutexD, "Process D");
    return NULL;
}

// process E
void *processE(void *arg)
{
    // wait for mutex B and D to be unlocked
    pthread_mutex_lock(&mutexB);
    pthread_mutex_unlock(&mutexB);
    pthread_mutex_lock(&mutexD);
    pthread_mutex_unlock(&mutexD);
    delay_and_unlock_mutex(&mutexE, "Process E");
    return NULL;
}

// process F
void *processF(void *arg)
{
    // wait for mutex C and D to be unlocked
    pthread_mutex_lock(&mutexE);
    pthread_mutex_unlock(&mutexE);
    delay_and_unlock_mutex(&mutexF, "Process F");
    return NULL;
}

int main()
{
    srand(time(0)); // seed the random number generator

    // lock all mutexes
    pthread_mutex_lock(&mutexA);
    pthread_mutex_lock(&mutexB);
    pthread_mutex_lock(&mutexC);
    pthread_mutex_lock(&mutexD);
    pthread_mutex_lock(&mutexE);
    pthread_mutex_lock(&mutexF);

    time(&start); // get the current time

    // create processes
    pthread_t threadA, threadB, threadC, threadD, threadE, threadF;
    pthread_create(&threadA, NULL, processA, NULL);
    pthread_create(&threadB, NULL, processB, NULL);
    pthread_create(&threadC, NULL, processC, NULL);
    pthread_create(&threadD, NULL, processD, NULL);
    pthread_create(&threadE, NULL, processE, NULL);
    pthread_create(&threadF, NULL, processF, NULL);

    pthread_join(threadA, NULL);
    pthread_join(threadB, NULL);
    pthread_join(threadC, NULL);
    pthread_join(threadD, NULL);
    pthread_join(threadE, NULL);
    pthread_join(threadF, NULL);

    // destroy mutexes
    pthread_mutex_destroy(&mutexA);
    pthread_mutex_destroy(&mutexB);
    pthread_mutex_destroy(&mutexC);
    pthread_mutex_destroy(&mutexD);
    pthread_mutex_destroy(&mutexE);
    pthread_mutex_destroy(&mutexF);
    return 0;
}
