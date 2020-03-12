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
	mensaje db "El resultado de la division es: " ;=oxa new line
	len equ $-mensaje
	mensaje1 db "ingrese el primer numero ",10 ;=oxa new line
	len1 equ $-mensaje1
	mensaje2 db "ingrese el segundo numero ",10 ;=oxa new line
	len2 equ $-mensaje2
	mensaje3 db 10,"el residuo es: " ;=oxa new line
	len3 equ $-mensaje3
	salto db 10,""
	
section .bss
	n1 resb 1
	n2 resb 1
	division resb 2
	residuo resb 2
section .text
	global _start
_start:
	escribir mensaje1,len1
	leer n1,2
	escribir mensaje2,len2
	leer n2,2
	
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div bl
	
	add al,'0'
	mov [division],al
	add ah,'0'
	mov [residuo],ah

	escribir mensaje,len
	escribir division,2
	escribir mensaje3,len3
	escribir residuo,2
	escribir salto,1
	mov eax,1
	int 80h
