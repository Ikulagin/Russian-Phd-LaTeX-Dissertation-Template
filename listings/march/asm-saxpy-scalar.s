    /* Assembler code */
L1:
    movss  (%rdi,%rax,4),%xmm1
    mulss   %xmm0,%xmm1
    addss    (%rsi,%rax,4),%xmm1
    movss   %xmm1,(%rsi,%rax,4)
    add       $0x1,%rax
    cmp      %eax,%edx
    jg          L1
