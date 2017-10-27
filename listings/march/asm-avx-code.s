/* Assembler vectorized AVX code */
    lea    -0x1(%r8),%ecx               
    xor    %eax,%eax                    
    add    $0x1,%rcx                    
    shl    $0x5,%rcx                    
    nopl   0x0(%rax)
L2: 
    vmulps (%rdi,%rax,1),%ymm2,%ymm1    
    vaddps (%rsi,%rax,1),%ymm1,%ymm1    
    vmovaps %ymm1,(%rsi,%rax,1)         
    add    $0x20,%rax                   
    cmp    %rax,%rcx                    
    jne    L2
L1: 
    shl    $0x3,%r8d                    
    cmp    %r8d,%edx                    
    movslq %r8d,%rax                    
    jle    L3
    nopl   0x0(%rax)
L4: 
    vmulss (%rdi,%rax,4),%xmm0,%xmm1    
    vaddss (%rsi,%rax,4),%xmm1,%xmm1    
    vmovss %xmm1,(%rsi,%rax,4)          
    add    $0x1,%rax                    
    cmp    %eax,%edx                    
    jg     L4
L3:
    vzeroupper
