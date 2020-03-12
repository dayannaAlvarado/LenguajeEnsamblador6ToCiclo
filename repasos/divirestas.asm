;DAYANNA ALVARADO
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
	len1 equ $-msj1

	msj2 db "Ingrese el segundo numero: " ;=oxa new line
	len2 equ $-msj2
	
	msj3 db "  El residuo de la division es: " ;=oxa new line
	len3 equ $-msj3

	msj4 db "  El cociente de la division es: " ;=oxa new line
	len4 equ $-msj4
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
	escribir msj1, len1
	leer n1, 2
;**********************segundo numero****************
	escribir msj2, len2
	leer n2, 2

	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mov cx,0
	
dividir:	
	sub al, bl
	inc cx
	cmp al,bl
	jg dividir
        je dividir
	jmp restar
 
restar:	
	add al,'0'
	add cx,'0'
	mov [division], cx
	mov [residuo], al

        escribir msj4, len4
	escribir division,1

	escribir new_line,1

        escribir msj3, len3
	escribir residuo,1        

	escribir new_line,1

        jmp salir
salir: 
        mov eax, 1
        int 80h
