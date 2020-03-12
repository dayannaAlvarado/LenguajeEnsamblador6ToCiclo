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
		msj db 'Ingrese la base',10
		lenmsj equ $- msj
        msj1 db 'Ingrese el exponente',10
		lenmsj1 equ $- msj1
		mensaje db 'El resultado de la potencia es:'
		lenmensaje equ $- mensaje
        nueva_linea db 10,''
		
section .bss
		base resb 1
		exp resb 2
section .text
		global _start
_start:
        escribir msj,lenmsj
        lectura base,2
        escribir msj1,lenmsj1
        lectura exp,1
        mov al,[base]
        mov ecx,[exp]
        sub al,'0'
        sub ecx,'0'
        sub ecx,1
        mov bl,al
        mov dl,bl
proceso:
       
       
        mul bl
        loop proceso
        
imprimir:
        push eax
         escribir mensaje,lenmensaje
        pop eax
        add al,'0'
        mov [base],al

        mov eax,4
        mov ebx,1
        mov ecx,base
        mov edx,1
        int 80h
        jmp salir
linea:
        escribir nueva_linea,1
        ret
salir:
        call linea
        mov eax,1
        int 80h