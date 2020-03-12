%macro leer 2
	mov eax,3
	mov ebx,0
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data
	mensaje db "El resultado de la suma es: " ;=oxa new line
	len equ $-mensaje
	mensaje1 db "ingrese el primer numero ",10 ;=oxa new line
	len1 equ $-mensaje1
	mensaje2 db "ingrese el segundo numero ",10 ;=oxa new line
	len2 equ $-mensaje2

section .bss
	n1 resb 2
	n2 resb 2
	suma resb 2
section .text
	global _start
_start:
	escribir mensaje1,len1
	leer n1,2
	escribir mensaje2,len2
	leer n2,2

	mov eax,[n1]
	sub eax,'0'

	mov ebx,[n2]
	sub ebx,'0'
	
	add eax,ebx
	add eax,'0'
	mov [suma],eax
	escribir mensaje,len
	escribir suma,2

	mov eax,1
	int 80h
