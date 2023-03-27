;addition: add destination source
;soustraction: sub destination source
;multiplication: mul source
;division: div source
BITS 64
global _start

section .text
_start:

    ;mov rax, 100
    ;add rax, 100 ;dans le ragistre rax on aura la valeur de 200
    ;soustraction
    ;mov rdi, 50
    ;sub rdi, 50 ;dans le registre rdi on aura la valeur de 0
    ;division
    ;mov rax, 10
    ;mov rdi, 5
    ;div rdi ;dans le registre rax on aura la valeur de 2
    ;multiplication
    mov rax, 10
    mov rdi, 5
    mul rdi ;dans le registre rax on aura la valeur de 50