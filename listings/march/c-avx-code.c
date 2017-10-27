/* C vectorized AVX code */
__m256 *xx = (__m256 *)x;
__m256 *yy = (__m256 *)y;

int k = n / 8;
__m256 aa = _mm256_set1_ps(a);
for (int i = 0; i < k; i++) {
    __m256 z = _mm256_mul_ps(aa, xx[i]);          
    yy[i] = _mm256_add_ps(z, yy[i]);
}

for (int i = k * 8; i < n; i++)
    y[i] = a * x[i] + y[i];

