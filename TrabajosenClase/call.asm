	


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
	mov ebx,ecx
	push ebx
	call nueva_linea;
	pop ebx
	mov ecx,ebx
	push ebx
columna:
	push ecx
	call asterisco
	pop ecx
	loop columna
	pop ecx
	pop ebx
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
