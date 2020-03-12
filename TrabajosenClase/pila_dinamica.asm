%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro lectura 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    mensaje db "Ingrese un numero del 1-9: ",10
	len equ $ - mensaje
	as db  "*"
	msj_enter db 10,""
   

section .bss

	n1 resb 2
	
section .text 
    global _start:
_start:
    escribir mensaje,len
    lectura n1,1

	mov eax,[n1]
	sub eax,'0'
	mov ebx, [n1]
	sub eax,'0'
    jmp ciclo

    
ciclo:
	dec ebx	
	push ebx
    ;escribir as,1
	jmp imprimir

imprimir:
	
    dec eax	
	push eax
    escribir as,1
	pop eax
		
	cmp eax, 0
	jz regresar
	jmp imprimir

regresar:
	escribir msj_enter,1	
	pop ebx
	mov eax,[n1]
	sub eax,'0'
	cmp ebx, 0
	jz salir
	jmp ciclo

salir:
    mov eax,1
    int 80H

