#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>
#include <fcntl.h>

int main(void) {
    struct stat s;
    long *x, n, i;
    int file;
    double mean, tmp, dsum = 0.0;
    uint64_t sum = 0;
    
    stat("/tmp/data.bin", &s);
    n = s.st_size / sizeof(long);
    
    file = open("/tmp/data.bin", O_RDONLY, 0644);
    
    x = mmap(NULL, s.st_size, PROT_READ, MAP_SHARED, file, 0); 
    
    for (i = 0; i<n; i++) {
        sum += x[i];
    }

    mean = sum / n;
    
    printf("Mean: %lf\n", mean);

    for (i = 0; i<n; i++) {
        tmp = x[i] - mean;
        dsum += tmp*tmp;
    }

    printf("Variance: %le\n", dsum/n);
    munmap(x, s.st_size);
    close(file);
    return 0;
}
