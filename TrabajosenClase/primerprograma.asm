section .data
        mensaje db "Hola macho dominante",10
        tamano equ $-mensaje
        mensaje2 db "andres",10
        tamano2 equ $-mensaje2
        mensaje3 db "cuenca",10
        tamano3 equ $-mensaje3
        mensaje4 db "camacho",10
        tamano4 equ $-mensaje4
        
        
section .text
        global _start
_start:
        mov eax,4
        mov ebx,1
        mov ecx,mensaje
        mov edx,tamano
        int 80H
        mov eax,4
        mov ebx,1
        mov ecx,mensaje2
        mov edx,tamano2
        int 80H
        mov eax,4
        mov ebx,1
        mov ecx,mensaje3
        mov edx,tamano3
        int 80H
        mov eax,4
        mov ebx,1
        mov ecx,mensaje4
        mov edx,tamano4
        int 80H

        mov eax,1
        int 80H