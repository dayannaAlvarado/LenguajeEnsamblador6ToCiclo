section .data
	msj db "Item: "
	len equ $- msj
	linea db 10,""
section .bss
	num resb 1
section .text
	global _start
_start:
	mov cx,4
ciclo:	
	cmp cx,0
	je salir
	dec cx
	jmp imprimir
imprimir:
	
	mov eax,4
	mov ebx,1
	push cx

	add cx,'0'
	mov [num],cx

	mov ecx,msj
	mov edx,len
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,num
	mov edx,1

	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,linea
	mov edx,1

	int 80h
	pop cx	
	jmp ciclo
salir:
	mov eax,1
	int 80h
