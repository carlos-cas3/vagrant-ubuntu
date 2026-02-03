#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <unistd.h>

#define N 10000
#define BINS 10
#define MAX_VAL 100

int main(int argc, char* argv[]) {

    int rank, size;
    int local_hist[BINS] = {0};
    int global_hist[BINS] = {0};

    char hostname[256];

    MPI_Init(&argc, &argv);

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    gethostname(hostname, sizeof(hostname));

    if (rank == 0) {
        printf("\n[MASTER] rank=%d | host=%s | total_procs=%d\n",
               rank, hostname, size);
    } else {
        printf("[WORKER] rank=%d | host=%s\n",
               rank, hostname);
    }

    int local_n = N / size;

    int *data = NULL;
    if (rank == 0) {
        data = (int*) malloc(N * sizeof(int));
        srand(123);
        for (int i = 0; i < N; i++) {
            data[i] = rand() % MAX_VAL;
        }
    }

    int *local_data = (int*) malloc(local_n * sizeof(int));

    MPI_Scatter(
        data,
        local_n,
        MPI_INT,
        local_data,
        local_n,
        MPI_INT,
        0,
        MPI_COMM_WORLD
    );

    int bin_width = MAX_VAL / BINS;

    for (int i = 0; i < local_n; i++) {
        int bin = local_data[i] / bin_width;
        if (bin >= BINS) bin = BINS - 1;
        local_hist[bin]++;
    }

    MPI_Reduce(
        local_hist,
        global_hist,
        BINS,
        MPI_INT,
        MPI_SUM,
        0,
        MPI_COMM_WORLD
    );

    if (rank == 0) {
        printf("\nHistograma final:\n");
        for (int i = 0; i < BINS; i++) {
            printf("Bin %d: %d\n", i, global_hist[i]);
        }
    }

    free(local_data);
    if (rank == 0) free(data);

    MPI_Finalize();
    return 0;
}
