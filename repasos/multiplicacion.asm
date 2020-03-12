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
	msj1 db "Ingrese el primer numero: " ;=oxa new line
	lenmsj1 equ $-msj1

	msj2 db "Ingrese el segundo numero: " ;=oxa new line
	lenmsj2 equ $-msj2
	msjmul db 10,"El resultado de la multiplicacion  es: " ;=oxa new line
	lenmul equ $-msjmul
section .bss
	n1 resb 2
	n2 resb 2
	multi resb 2
section .text
	global _start
_start:
	escribir msj1,lenmsj1
	leer n1,2
	escribir msj2,lenmsj2
	leer n2,2

	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'
	mov [multi],al
	escribir msjmul,lenmul
	escribir multi,2
	mov eax,1
	
	int 80h
	
