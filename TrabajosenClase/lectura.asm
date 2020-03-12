section .data
        mensaje db "Escriba su nombre",10
	tamanomensaje equ $-mensaje
	mensaje2 db "Su nombre es"
	tamanomensaje2 equ $- mensaje2
	

section .bss
	nombre resb 5
	tamanonombre equ $-nombre

section .text
	global _start
_start: 
	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,tamanomensaje
	int 80H
	 
	mov eax,3
	mov ebx,2
	mov ecx,nombre
	mov edx,tamanonombre
	int 80H

        
	mov eax,4
	mov ebx,1
	mov ecx,mensaje2
	mov edx,tamanomensaje2
	int 80H

 
	mov eax,4
	mov ebx,1
	mov ecx,nombre
	mov edx,tamanonombre
	int 80H




        mov eax,1
        int 80H
