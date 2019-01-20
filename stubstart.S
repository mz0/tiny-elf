.globl _start

_start:
    call main
    mov  $60, %eax # exit
    movq $42, %rdi   
    syscall
