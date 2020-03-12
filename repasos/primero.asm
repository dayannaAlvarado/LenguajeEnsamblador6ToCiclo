%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx,%2
	int 80h
%endmacro
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
	escribir mensaje,tamano
	escribir mensaje2,tamano2	
	escribir mensaje3,tamano3
	escribir mensaje4,tamano4
	
	mov eax,1
	int 80h
