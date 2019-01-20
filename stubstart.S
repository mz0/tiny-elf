.globl _start

_start:
    call main
    mov %rax, %rdi  # callee passes exit code in RAX
    mov  $60, %eax  # _exit(exit_code). RDI holds the 1st parameter
    syscall
