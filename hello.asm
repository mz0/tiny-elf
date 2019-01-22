section .rodata
    msg db "hello, world!",10

section .text
    global _start
_start:
    mov	rax, 1	; sys_write(fd, *buf, count) syscall
    mov	rdi, 1	 ; (unsigned int fd, ,) 1=stdout
    mov	rsi, msg ; ( ,const char *buf,)
    mov	rdx, 14	 ; ( ,  , size_t count) =length(msg)
    syscall
    mov	rax, 60	; sys_exit(error_code) syscall
    mov	rdi, 42	 ; (int error_code)
    syscall
