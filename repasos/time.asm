%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data
	msj db 'Desplegar los asteriscos 9 veces', 10
	len equ $ - msj
	asterisco times 9 db  '*',10
	len_asterisco equ $ - asterisco

section .text
	global _start
_start:
	escribir msj,len
	escribir asterisco,len_asterisco

	mov eax,1
	int 80h
