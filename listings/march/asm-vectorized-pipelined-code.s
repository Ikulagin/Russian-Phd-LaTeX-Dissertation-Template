 /* Assembler of pipelined and vectorized code */
    movaps (%rdi), %xmm2
    movaps 16(%rdi), %xmm1
    movaps (%rsi), %xmm3
    mulps %xmm0, %xmm2
.L3:
    mulps %xmm0, %xmm1
    addps %xmm2, %xmm3
    movaps %xmm3, (%rsi, %rax)
    movaps %xmm1, %xmm2
    movaps 16(%rsi, %rax), %xmm3
    movaps 32(%rdi, %rax), %xmm1

    addq    $16, %rax
    cmpq    %rdx, %rax
    jne .L3

    mulps %xmm0, %xmm1
    addps %xmm2, %xmm3
    movaps %xmm3, (%rsi, %rax)
