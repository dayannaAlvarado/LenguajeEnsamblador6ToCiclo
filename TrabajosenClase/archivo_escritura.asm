section .data
    archivo db "/home/daya/Documentos/Ensamblador/mm.txt",0
    error db "Error...Direccion no encontrada",10
    len_error equ $- error
section .bss
    texto resb 35
    idtexto resb 1
section .text
    global _start
_start:
    mov eax,3
    mov ebx,1 ;puede ser el 2
    mov ecx,texto
    mov edx,35
    int 80h 

    mov eax,8
    mov ebx,archivo
    mov ecx,1
    mov edx,777h ;0x1FF
    int 80h
    test eax,eax
    jz erro

    mov dword [idtexto],eax                                                                                                             

    mov eax, 4
    mov ebx, [idtexto]
    mov ecx,texto
    mov edx,35
    int 80h
    jmp salir
erro:
    mov eax, 4
    mov ebx, 1
    mov ecx,error
    mov edx, len_error
    int 80h
    
salir:
    mov eax,1
    int 80h