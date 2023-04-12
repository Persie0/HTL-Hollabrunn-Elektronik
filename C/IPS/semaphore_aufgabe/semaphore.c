#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <stdlib.h>

// gcc -pthread -o semaphore semaphore.c
//./semaphore

sem_t gate;       // Semaphore for the gate with start value 1
sem_t delivery;   // Semaphore for the delivery area with start value 1
sem_t packages; // Semaphore for counting used space with start value 0

void *supplier(void *arg) {
    while (1) {
        sem_wait(&gate);
        printf("Supplier entered through the gate.\n");
        sem_post(&gate);
        printf("Supplier entered the warehouse.\n");

        sem_post(&packages);
        sem_post(&packages);
        sem_post(&packages);
        printf("Supplier unloaded 3 packages and left the warehouse.\n");

        sem_wait(&gate);
        printf("Supplier left through the gate.\n");
        sem_post(&gate);

        //sleep for 3 to 20 seconds
        int i = rand() % 18 + 3;
        printf("Supplier sleeps for %d seconds.\n", i);
        sleep(i);
    }
}

void *deliverer_a(void *arg) {
    while (1) {
        sem_wait(&gate);
        printf("Deliverer A entered through the gate.\n");
        sem_post(&gate);

        sem_wait(&delivery);
        printf("Deliverer A entered the delivery area.\n");

        sem_post(&packages);
        sem_post(&packages);
        sem_post(&delivery);
        printf("Deliverer A loaded 2 packages and left the delivery area.\n");

        sem_wait(&gate);
        printf("Deliverer A left through the gate.\n");
        sem_post(&gate);

        //sleep for 3 to 20 seconds
        int i = rand() % 18 + 3;
        printf("Deliverer A sleeps for %d seconds.\n", i);
        sleep(i);
    }
}

void *deliverer_b(void *arg) {
    while (1) {
        sem_wait(&gate);
        printf("Deliverer B entered through the gate.\n");
        sem_post(&gate);

        sem_wait(&delivery);
        printf("Deliverer B entered the delivery area.\n");
        
        sem_post(&packages);
        sem_post(&delivery);
        printf("Deliverer B loaded 2 packages and left the delivery area.\n");

        sem_wait(&gate);
        printf("Deliverer B left through the gate.\n");
        sem_post(&gate);

        //sleep for 3 to 20 seconds
        int i = rand() % 18 + 3;
        printf("Deliverer B sleeps for %d seconds.\n", i);
        sleep(i);
    }
}

int main() {
    // Initialize the semaphores
    sem_init(&gate, 0, 1);
    sem_init(&delivery, 0, 1);
    sem_init(&packages, 0, 10);

    // Create the threads
    pthread_t supplier_thread, deliverer_a_thread, deliverer_b_thread;
    pthread_create(&supplier_thread, NULL, supplier, NULL);
    pthread_create(&deliverer_a_thread, NULL, deliverer_a, NULL);
    pthread_create(&deliverer_b_thread, NULL, deliverer_b, NULL);

    // Wait for the threads to finish
    pthread_join(supplier_thread, NULL);
    pthread_join(deliverer_a_thread, NULL);
    pthread_join(deliverer_b_thread, NULL);

    // Destroy the semaphores
    sem_destroy(&gate);
    sem_destroy(&delivery);
    sem_destroy(&packages);
    return 0;
}
