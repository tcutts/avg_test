#include <stdio.h>
#include <stdlib.h>
#define DATASIZE 1000000000

int main(void) {
    long i, n;
    FILE *T, *B;
    T = fopen("/tmp/data.txt", "w");
    B = fopen("/tmp/data.bin", "w");
    for (i=0; i<DATASIZE; i++) {
        n = random();
        fprintf(T, "%ld\n", n);
        fwrite(&n, sizeof(long), 1, B);
    }
    fclose(T);
    fclose(B);
    return 1;
}
