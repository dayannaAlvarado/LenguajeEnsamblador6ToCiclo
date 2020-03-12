
section .data
    mensaje db "*"
    new_line db 10,""
section .bss
    fila resb 1
    colum resb 2
section .text
    global _start:
_start:
	mov ecx,9
	mov ebx,9
fil:
    push ecx
    mov eax,4
    mov ebx,2
    mov ecx,mensaje
    mov edx,1
    int 80h

    mov eax,4
    mov ebx,2
    mov ecx,new_line
    mov edx,1
    int 80h
    pop ecx
    loop fil
salir:

    mov eax,1
    int 80h