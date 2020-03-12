;macro
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro

%macro leer 2
	mov eax,3
	mov ebx,0
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro


section .data
	msj1 db "Numero mayor "
	len1 equ $ - msj1
	msj2 db "Numero menor"
	len2 equ $ - msj2
	msj5 db "Numeros iguales "
	len5 equ $ - msj5
	msj3 db "Ingrese el primer numero: " ;=oxa new line
	len3 equ $-msj3

	msj4 db "Ingrese el segundo numero: " ;=oxa new line
	len4 equ $-msj4
	salto db 10,""

	
section .bss
	
	n1 resb 1
	n2 resb 1
section .text
	global _start
_start:
		
;***********************primer numero****************	
opciones:
	escribir msj3, len3
	leer n1, 2
;**********************segundo numero****************
	

	escribir msj4, len4
	leer n2, 2


	mov al,[n1]
	mov bl,[n2]
	cmp al, bl
	jg mayor
	je igual
	jl menor

mayor: 
	escribir msj1, len1
	jmp salir
	int 80H
	
menor:
	escribir msj2, len2
	int 80H
	escribir salto,1
	jmp opciones
igual:
	escribir msj5, len5
	jmp salir	
	int 80H
	
salir:	
	mov eax,1
	int 80H
