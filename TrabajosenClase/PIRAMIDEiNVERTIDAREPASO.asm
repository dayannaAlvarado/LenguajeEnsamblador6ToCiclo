section .data
		asterisco db '*'
        espacio db ' '
		nueva_linea db 10,''
section .text
		global _start

_start:
		mov ecx,9
		mov ebx,0
        push ecx
esp:
        push ebx
        call  imprimir_espacio
        pop ebx
        mov ecx,ebx
        loop esp
        inc ebx
        pop ecx
fil:
        push ecx
        push ebx
        call  imprimir_asterisco
        pop ebx
        pop ecx
        loop fil
        call enter
        jmp salir
imprimir_asterisco:
	mov eax, 4
	mov ebx, 1
	mov ecx, asterisco
	mov edx, 1
	int 80h
	ret

imprimir_espacio:
	mov eax, 4
	mov ebx, 1
	mov ecx, espacio
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

