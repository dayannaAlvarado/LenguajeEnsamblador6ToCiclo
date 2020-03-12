	


section .data
    mensaje db "*"
    new_line db 10,""
section .bss
    fila resb 1
    colum resb 2
section .text
    global _start:
_start:
	mov ecx,9
	mov ebx,9
	jmp fila
fila:
	push ecx
	call nueva_linea;
	pop ecx
	
columna:
	push ecx
	call asterisco
	pop ecx
	push ecx
	loop columna
	pop ecx
	loop fila
	jmp salir
asterisco:
	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,1
	int 80h
	ret


nueva_linea:
	mov eax,4
	mov ebx,1
	mov ecx,new_line
	mov edx,1
	int 80h
	ret
salir: 
	mov eax, 1
	int 80h
