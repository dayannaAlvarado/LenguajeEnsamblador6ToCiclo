section .data
		asterisco db '*'
		nueva_linea db 10,''
section .text
		global _start

_start:
		mov ecx, 9
		mov ebx, 1
l1:
	push ecx	
	push ebx
	call enter 
	
	pop ecx
	mov ebx, ecx
	push ebx
	
l2:
	push ecx		
	call imprimir_asterisco
	pop ecx
	loop l2
	
	pop ebx
	pop ecx
	inc ebx
	loop l1

	jmp salir

imprimir_asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	ret
	
enter:
	mov eax, 4
	mov ebx, 1
	mov ecx, nueva_linea 
	mov edx, 1
    
	int 80h
	ret

salir:
    mov eax,1
    int 80H

