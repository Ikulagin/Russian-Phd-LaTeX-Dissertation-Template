 /* Assembler of unrolled vectorized code  */
    /* Prologe loop */
    movaps (%rdi), %xmm2
    movaps 16(%rdi), %xmm1
    movaps (%rsi), %xmm3
    mulps %xmm0, %xmm2
.L3:
    mulps %xmm0, %xmm1
    addps %xmm2, %xmm3

    movaps 16(%rsi, %rax), %xmm4
    movaps 32(%rdi, %rax), %xmm2
    movaps %xmm3, (%rsi, %rax)
    addps %xmm1, %xmm4
    mulps %xmm0, %xmm2

    movaps 48(%rdi, %rax), %xmm1
    movaps 32(%rsi, %rax), %xmm3
    movaps %xmm4, 16(%rsi, %rax)

    addq    $32, %rax
    cmpq    %rdx, %rax
    jne .L3
    /* Epiloge loop */
    mulps %xmm0, %xmm1
    addps %xmm2, %xmm3
    movaps %xmm3, (%rsi, %rax)
    movaps 16(%rsi, %rax), %xmm4
    addps %xmm1, %xmm4
    movaps %xmm4, 16(%rsi, %rax)
