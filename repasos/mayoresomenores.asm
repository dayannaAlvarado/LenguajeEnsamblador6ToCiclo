section .data
	msj db "Numero mayor "
	len equ $ - msj
	msj1 db "Numero menor"
	len1 equ $ - msj1

section .text
	global _start
_start:
	mov al, 2
	mov bl, 4
	cmp al, bl
	jg mayor
	jmp menor
mayor: 
	mov eax, 4
	mov ebx, 1
	mov ecx, msj
	mov edx, len
	int 80H
	jmp salir
menor:
	mov eax, 4
	mov ebx, 1 
	mov ecx, msj1
	mov edx, len1
	int 80H
salir:	
	mov eax,1
	int 80H
