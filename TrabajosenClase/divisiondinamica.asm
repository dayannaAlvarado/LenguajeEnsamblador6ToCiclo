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
	mensaje db "El resultado de la division es: " ;=oxa new line
	len equ $-mensaje
	mensaje1 db "ingrese el primer numero ",10 ;=oxa new line
	len1 equ $-mensaje1
	mensaje2 db "ingrese el segundo numero ",10 ;=oxa new line
	len2 equ $-mensaje2
	mensaje3 db 10,"el residuo es: " ;=oxa new line
	len3 equ $-mensaje3
	new_line db 10,""

section .bss
	n1 resb 1
	n2 resb 1
	division resb 1
	residuo resb 1
section .text
	global _start
_start:
;***********************primer numero****************	
	escribir mensaje1, len1
	leer n1, 2
;**********************segundo numero****************
	escribir mensaje2, len2
	leer n2, 2
;*********************proceso de division***************
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div bl
;*********************cociente*******************
	add al,'0'
	mov [division],al
;*********************residuo*******************
	add ah,'0'
	mov [residuo],ah
;*********************imprime la division **************
	escribir mensaje, len
	escribir division,1
	escribir mensaje3, len3
	escribir residuo,1
	escribir new_line,1
		
	mov eax,1
	int 80H
