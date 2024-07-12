#include <stdio.h>
#include <stdint.h>

int main(void) {
    FILE *f;
    double x, mean, sum = 0.0, dsum = 0.0;
    long n = 0;

    /* Compute the mean of the numbers */
    f = fopen("/tmp/data.txt", "r");
    while (!feof(f)) {
        fscanf(f, "%lf\n", &x);
        n++; sum+=x;
    }
    mean = sum/n;
    printf("Mean: %lf\n", mean);

    /* Go back to the beginning of the file and
     * compute the variance */
    fseek(f, 0, SEEK_SET);
    while (!feof(f)) {
        fscanf(f, "%lf\n", &x);
        dsum += (x - mean)*(x - mean);
    }
    printf("Variance: %le\n", dsum/n);
    fclose(f);
    return 0;
}
