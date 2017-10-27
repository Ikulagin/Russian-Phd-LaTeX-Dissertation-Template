 /* Assembler vectorized code */
L1:
   movaps (%rdi,%rax,1),%xmm1
   mulps  %xmm0,%xmm1
   addps  (%rsi,%rax,1),%xmm1
   movaps %xmm1,(%rsi,%rax,1)
   add    $0x10,%rax
   cmp    %rax,%rdx
   jne    L1
