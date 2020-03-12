;macro
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro


section .data
	mensaje db "El resultado de la division es: " ;=oxa new line
	len equ $-mensaje
	mensaje3 db 10,"el residuo es: ";=oxa new line
	len3 equ $-mensaje3
	new_line db 10,"" 
section .bss
	division resb 1
	residuo resb 1
section .text
	global _start
_start:


;*********************proceso de division***************
	mov al,9
	mov bl,2
	div bl
	
;*********cociente**********
	add al,'0'
	mov [division],al
	
;********residuo************
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
