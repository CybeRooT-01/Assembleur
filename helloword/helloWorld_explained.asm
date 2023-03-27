; Les SECTIONS [bss, rodata, text]: on a trois sections:
;BSS : section pour socker les variables non initialisés comme: var age (js) , char nom[10] ...
;rodata : section pour stocker les variables initialisés var age = 12 (js), char nom[10] = doudou
;text : section pour tout le code qui va etre executé
;global _start (equivalent un tout petit peu de la fonction main)
;DEUX architechture (les syntaxe )
;AT&T : quand on a un code objet, on met objdump -d test (pour voir le code asssembleur, on verra du code moche)
;intel: qd on met objdump -d -M intel test (pour voir le code assembleur avec l'ecriture plus claire( architechture intel)
;les registres
; rax => 64 bits | eax => 32 bits | ax => 16 bits | ah => 8bits (partie haute) et al => 8bits(partie basse)
; rdi => 64 bits | ebx => 32 bits | bx => 16 bits | bh => 8bits (partie haute) et bl => 8bits(partie basse)
; rsi => 64 bits | ecx => 32 bits | cx => 16 bits | ch => 8bits (partie haute) et cl => 8bits(partie basse)
; rdx => 64 bits | edx => 32 bits | dx => 16 bits | dh => 8bits (partie haute) et dl => 8bits(partie basse)
; mov <destination> <source> par exemple mov rax 12 signifie en quelque sorte rax = 12...
; db => define byte (1 octect 8 bits koi suffit pour stocker une chaine de caractére)
; dw => define word (2 octects 16 bits koi) 
; dd => define double word (4 octects 32 bits koi)
;syscall => appel kernel
; =================Ce code permet d'afficher hello word ====================
global _start ; pour que le programme s'execute a partir de l'tiquette _start (comme la fonction main koi) etiquette c'est comme une fonction
section .rodata ;parcequ'on va declarer une variable initialisé qui contient hello word
    helloword db "Hello World", 10 , 0 ; helloword c'est le nom de notre variable ; db parcequ'on va ecrire une chaine de char, 10 pour un '\n' (dans la table ASCII '\n' =10, et 0 pour le null byte (l'octect nul)
    helloword_len equ $-helloword ; on donne a la variable helloword_len la taille de la variable helloword ($- est le strlen() koi en quelque sortes) le equ pour affecter un entier
section .code
_start: ;ici on fait nos syscall puisqu'on veux faire un syswrite on va faire les memes appel system que sur la table des syscall (disponible sur internet)
    mov rax , 1 ; "dans rax, met y 1 " en quelques sortes.
    mov rdi, 1;  1 c'est le file descriptor: le numero correspondant pour la sortie du clavier est la sortie 1
    mov rsi, helloword ; notre variable contenant la chaine
    mov rdx, helloword_len ; notre variable contenant la taille de notre variable
                                         ; maintenant nos registre sont rempli; on fait appel au kernel avec le mot syscall
    syscall
    jmp _exit ;va executer l'etiquette exit
    ;quand on fait echo $? on verra qu'on a l'erreur 139 parceque e programme c'est pas fermer correctement donc on le ferme en appelant le syscall exit
    ;mov rax ,60 ; ce qui correspond au rax du syscall exit dasn la table
    ;mov rdi, 0 ; et 0 le interor code pour lui dire pas de panique tout va bien ! 
    ;on va reecrire l'exit mais en beau dans un autre etiquette
_exit:
    mov rax, 60
    mov rdi, 0
    syscall ; apres chaque etiquette on appelle le kernel
    ;pour executer c'est :
    ; nasm -f elf64 notrefichier.asm -o notrecodeobjet.o
    ;ensuite ld notrecodeobjet.o -o notreexecutable
    ;ensuite ./notrexecutable
    ;echo $? pour voir le messsage d'erreur

;en debuggant je me suis rendu compt que avec ubuntu quand vous appelez la section .text par .code il affiche segmentation fault. DOnc si vous etes sur ubuntu  mettez simplement .text a la place de .Code