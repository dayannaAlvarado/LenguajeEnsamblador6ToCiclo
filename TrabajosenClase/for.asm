section .data
	msj db 10,'Item:' 
	len equ $ - msj
section .bss
	num resb 1
section .text
	global _start:
	
_start:

	mov cx,4
	
ciclo:
	cmp cx,0	
	jz salir
	
	
	jnz imprimir
imprimir:
	mov eax, 4
	mov ebx,1
	push cx 		;guardar en la pila

	add cx,'0'
	mov [num],cx

	mov ecx, msj
	mov edx, len
	int 80h
	
	
	
	mov eax, 4
	mov ebx,1
	mov ecx,num
	mov edx,1
	int 80h
	pop cx  		;obtener de la pila
	dec cx	
	jmp ciclo
	
	

	
salir:
	mov eax,1
	int 80h
