%macro escribir 2
	mov eax, 4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro leer 2
	mov eax, 3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
	msj_1 db 'ingrese el primer numero',10
	len_1	equ $ - msj_1
	msj_2 db 'ingrese el segundo numero',10
	len_2	equ $ - msj_2
	msj_positivo db 'es positivo',10 
	len_positivo equ $ - msj_positivo
	msj_negativo db 'es negativo',10	
	len_negativo equ $ - msj_negativo
section .bss
	n1 resb 2
	n2 resb 2

section .text
	global _start:

_start:
	escribir msj_1, len_1
	leer n1,2
	escribir msj_2, len_2
	leer n2,2

	mov eax,[n1]
	mov ebx,[n2]

	sub eax,'0'
	sub ebx, '0'

	sub eax,ebx
	add eax,'0'
	js negativo
	jmp positivo

negativo:
	
	escribir msj_negativo, len_negativo
	jmp salir

positivo:
	escribir msj_positivo, len_positivo
	jmp salir

salir:
	mov eax,1
	int 80h


