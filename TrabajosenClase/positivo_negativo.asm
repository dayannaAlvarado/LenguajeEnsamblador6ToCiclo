section .data
	msj_negativo db 'es negativo', 10
	len_negativo equ $ - msj_negativo 
	msj_positivo db 'es positivo', 10	
	len_positivo equ $ - msj_positivo 

section .text
	global _start:
	
_start:
	mov ax,9
	mov bx,5
	sub ax,bx
	js negativo
	jns positivo

negativo:
	mov eax,4
	mov ebx,1
	mov ecx, msj_negativo
	mov edx, len_negativo
	int 80h
	jmp salir

positivo:
	mov eax,4
	mov ebx,1
	mov ecx, msj_positivo
	mov edx, len_positivo
	int 80h
	jmp salir

salir:
	mov eax,1
	int 80h
