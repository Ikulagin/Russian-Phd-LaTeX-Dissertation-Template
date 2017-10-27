  /* C vectorized code */
__m128 *xx = (__m128 *)x;
__m128 *yy = (__m128 *)y;

int k = n / 4;
__m128 aa = _mm_set1_ps(a);
for (int i = 0; i < k; i++) {
    __m128 z = _mm_mul_ps(aa, xx[i]);
    yy[i] = _mm_add_ps(z, yy[i]);
}
