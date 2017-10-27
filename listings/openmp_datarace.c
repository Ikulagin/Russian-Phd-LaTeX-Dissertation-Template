int summ = 0;
int i;
int n = omp_get_thread_num() * 1000;

#pragma omp parallel for shared(summ)
for (i = 0; i < n; i++) {
    int a = func(i);
    summ += a;
}
