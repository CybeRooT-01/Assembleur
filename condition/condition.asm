BITS 64
;=======des flags pour determiner les condition=====
;===FLAGS POUR LES UNSIGNED 
;je (jump equal): on va changer d'etiquette si la condition est une egalite
;ja (jump above): on va changer d'etiquette si la condition est une superiorité
;jae (jump above equal): on va changer d'tiquette si la condition est superieur ou egal
;jb (jump below): on va changer d'etiquette si la condition esy une inferiorité
;jbe (jump below equal): on va changer d'etiquette si la condition est un inferieur ou egal
;===FLAGS POUR LES SIGNED 
;jg (jump greater): change d'etiquette si la condition est une superiorite
;jge (jump greater equal): change d'etiquette si la condition est une superiorité ou egal
;jl (jump lower): change d'etiquette si la conditione st une inferiorité
;jle (jump lower equal): change d'etiquetyte si la condition est une inferioorité ou egal
;cmp <registre> <value>
global _start

section .rodata
	egalite db "sont egaux",0xA,0x0 ; 10 \n et 0 NullByte
	egalite_len equ $-egalite

	superiorite db "c'est superieur",0xA,0x0
	superiorite_len equ $-superiorite

	inferiorite db "c'est inferieur",0xA,0x0
	inferiorite_len equ $-inferiorite

section .text
_start: 
	mov rax, 0x9 ;11 
	;debut des comparaisons:
	cmp rax, 0xA ;1 compare la valeur du registre rax et 10 (0xA)
	je _egalite  ;	je change d'etiquette si la condition est une egalite
	cmp rax, 0xA ;1  compare la valeur du registre rax et 10 (0xA)
	jg _superiorite ;	je change d'etiquette si la condition est une superiorité
	cmp rax, 0xA ; 1 compare la valeur du registre rax et 10 (0xA)
	jl _inferiorite ;	je change d'etiquette si la condition est une inferiorité
_egalite:
	mov rax, 0x1 ;1
	mov rdi, 0x1 ;1
	mov rsi,egalite
	mov rdx, egalite_len
	syscall
	jmp _exit
_superiorite:
	mov rax, 0x1 ;1
	mov rdi, 0x1 ;1
	mov rsi, superiorite
	mov rdx, superiorite_len
	syscall
	jmp _exit
_inferiorite:
	mov rax, 0x1 ;1
	mov rdi, 0x1 ;1
	mov rsi, inferiorite
	mov rdx,inferiorite_len
	syscall
	jmp _exit
_exit:
	mov rax, 0x3c ;60
	mov rdi, 0x0 ;0
	syscall
