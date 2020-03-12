%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	msj db "Desplegar los asteriscos 9 veces",10
	len equ $- msj

section .text
	global _start
_start:
	escribir msj, len
	mov [msj], dword 'HOLA'
	escribir msj, len
	
	
	
	mov[msj+15],word 'hioal'
	escribir msj, len
	mov eax,1
	int 80h
