section .data
    msg db "hello, world!",10

section .text
    global _start
_start:
    mov	rax, 1	; write() syscall
    mov	rdi, 1	; stdout
    mov	rsi, msg
    mov	rdx, 14	; length(msg)
    syscall
    mov	rax, 60	; _exit() syscall
    mov	rdi, 42	; exit code
    syscall
