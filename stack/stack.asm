BITS 64
global _start

section .text
_start:
    mov rax, 45
    push rax ;on met la valeur 45 sur la stack (45 = 0x2d)
    push 78 ;on met la valeur 78 sur la stack (78 = 0x4e)
    pop rdi ;on met la valeur 78 dans rdi
    ;le premier a ajouter est le dernier a etre pop (LIFO)
    jmp _exit
_exit:
    mov rax, 0x3c
    mov rdi, 0
    syscall