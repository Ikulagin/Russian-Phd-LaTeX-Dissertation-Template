int summ = 0;
pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
/* Код, выполняемый множеством потоков. */
void *thread_body(void *)
{
    int i;
    ...
    for (i = begin; i < end; i++) {
        int a = func(i);
        pthread_mutex_lock(&m)
        summ += a;
        pthread_mutex_unlock(&m)
    }
    return NULL;
}
