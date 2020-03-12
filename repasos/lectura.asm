%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx, 0
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	mensaje db "Escriba su nombre",10
	tamanomensaje equ $-mensaje
	mensaje2 db "Su nombre es:  "
	tamanomensaje2 equ $- mensaje2
	
section .bss
	nombre resb 10
	len equ $-nombre
section .text
	global _start
_start:
	escribir mensaje,tamanomensaje
	leer nombre,len
	escribir mensaje2,tamanomensaje2
	escribir nombre,len

	mov eax,1
	int 80h
