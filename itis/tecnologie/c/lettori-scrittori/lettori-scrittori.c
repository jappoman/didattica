#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

// Dichiarazione dei semafori
sem_t resource_access; // Controlla l'accesso esclusivo alla risorsa condivisa
sem_t read_count_access; // Protegge l'aggiornamento del numero di lettori
int read_count = 0; // Numero di lettori attualmente attivi

// Funzione per il lettore
void *reader(void *arg) {
    int id = *((int *)arg);
    while (1) {
        // Accesso alla variabile read_count
        sem_wait(&read_count_access);
        read_count++;
        if (read_count == 1) {
            sem_wait(&resource_access); // Il primo lettore blocca gli scrittori
        }
        sem_post(&read_count_access);

        // Sezione di lettura
        printf("Lettore %d sta leggendo...\n", id);
        sleep(1);
        printf("Lettore %d ha finito di leggere.\n", id);

        // Uscita dalla lettura
        sem_wait(&read_count_access);
        read_count--;
        if (read_count == 0) {
            sem_post(&resource_access); // L'ultimo lettore sblocca gli scrittori
        }
        sem_post(&read_count_access);

        sleep(2 + rand() % 3); // Simula il tempo tra una lettura e l'altra
    }
    return NULL;
}

// Funzione per lo scrittore
void *writer(void *arg) {
    int id = *((int *)arg);
    while (1) {
        sem_wait(&resource_access); // Lo scrittore ottiene accesso esclusivo

        // Sezione di scrittura
        printf("\tScrittore %d sta scrivendo...\n", id);
        sleep(2);
        printf("\tScrittore %d ha finito di scrivere.\n", id);

        sem_post(&resource_access); // Lo scrittore rilascia la risorsa

        sleep(3 + rand() % 3); // Simula il tempo tra una scrittura e l'altra
    }
    return NULL;
}

int main() {
    pthread_t readers[5], writers[2]; // Creazione di 5 lettori e 2 scrittori
    int reader_ids[5], writer_ids[2];

    // Inizializzazione dei semafori
    sem_init(&resource_access, 0, 1); // Permette un solo scrittore alla volta
    sem_init(&read_count_access, 0, 1); // Protegge read_count

    srand(time(NULL)); // Inizializza il generatore di numeri casuali

    // Creazione dei thread lettori
    for (int i = 0; i < 5; i++) {
        reader_ids[i] = i + 1;
        pthread_create(&readers[i], NULL, reader, &reader_ids[i]);
    }

    // Creazione dei thread scrittori
    for (int i = 0; i < 2; i++) {
        writer_ids[i] = i + 1;
        pthread_create(&writers[i], NULL, writer, &writer_ids[i]);
    }

    // Attesa della terminazione dei thread
    for (int i = 0; i < 5; i++) {
        pthread_join(readers[i], NULL);
    }
    for (int i = 0; i < 2; i++) {
        pthread_join(writers[i], NULL);
    }

    // Distruzione dei semafori
    sem_destroy(&resource_access);
    sem_destroy(&read_count_access);

    return 0;
}
