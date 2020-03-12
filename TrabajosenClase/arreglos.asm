%macro escribir 2

		mov eax,4
		mov ebx,1
		mov ecx, %1
		mov edx, %2
		int 80h	
%endmacro
section .data
		msj db 'Ingrese 5 numeros',10
		lenmsj equ $- msj
		nueva_linea db 10,''
		msj1 db 'El numero mayor es:',10
		lenmsj1 equ $- msj1
		msj2 db 'El numero menor es:',10
		lenmsj2 equ $- msj2
;*************definir el arreglo****************
		arreglo db 0,0,0,0,0
		len equ $- arreglo
section .bss
		numero resb 2

section .text
		global _start

_start:
		escribir msj,lenmsj
;**************asignacion del arreglo en las posiciones efectivas
		mov esi,arreglo
		mov edi,0
leer:
		mov eax,3
		mov ebx,0
		mov ecx, numero
		mov edx, 2
		int 80h	
;**************asignacion de un numero en el arreglo
		mov al,[numero]
		sub al,'0'
		mov [esi],al
;**********+***incrementar una posicion en el arreglo
		add edi,1
		add esi,1
;**************comparar en el salto
		cmp edi,len
		jl leer;comparamos si es menor con jb se hace lo mismo
		mov esi,arreglo		
		mov edi,0
;**************imprimimos el contenido del arreglo
presentar:	
		mov al,[esi]
		add al,'0'
		mov [numero],al
		
		escribir numero,1
		add edi,1
		add esi,1
		cmp edi, len
		jb presentar
		mov esi,arreglo		
		mov edi,0
		mov bl,[esi]
;*************Obtenemos el mayor
mayor:		
		mov al,bl
		cmp edi,len
		jg presentar_mayor	
		add edi,1
		add esi,1
		mov bl,[esi]
		cmp al, bl
		jg mayor
		
		
				
presentar_mayor:
		cmp al,bl
		jg mayor_A
		jmp mayor_B
mayor_A:
		
		;add al,'0'
		mov [numero],al
		escribir nueva_linea,1
		escribir msj1, lenmsj1	
		escribir numero,1
		jmp salir
mayor_B:
		;add bl,'0'
		mov [numero],bl
		escribir nueva_linea,1
		escribir msj1, lenmsj1	
		escribir numero,1
		jmp salir			
salir:
		mov eax,1
		int 80h
		
