section .data
		msj db 'Ingrese el numero de series mayor a 2',10
		lenmsj equ $- msj
		cer db '0'
		lencer equ $- cer
		un db '1'
		lenun equ $- un		
		nueva_linea db 10,''
		msj1 db 'Serie FIbonacci:'
		lenmsj1 equ $- msj1
		
section .bss
		numero resb 1
		num1 resb 2
section .text
		global _start
_start:
	 call escribir_primero
	 call leer_numero
	 call imprimir_msjserie
	 call imprimir
	 jmp m	
	 ;jmp salir
imprimir:
        mov eax,4
	mov ebx,2
	mov ecx,cer
	mov edx,lencer
	int 80h
	mov eax,4
	mov ebx,2
	mov ecx,un
	mov edx,lenun
	int 80h
	ret 
escribir_primero:
	mov eax,4
	mov ebx,2
	mov ecx,msj
	mov edx,lenmsj
	int 80h
	ret
leer_numero:
	mov eax,3
	mov ebx,1
	mov ecx,numero
	mov edx,1
	int 80h
	ret
m:
	mov ecx,[numero]
	sub ecx,'0'
	sub ecx,2
a:
	mov eax,0
	mov ebx,1
proceso:																		
	mov edx,ebx
	add ebx,eax
	mov eax,edx		
	 push eax
	 push ebx
         push ecx
	 push edx
	 
	 add ebx,'0'
	 mov [num1],ebx			
	
	 call imprimir_serie
	
	 pop edx
	 pop ecx
	 pop ebx
	 pop eax
	 loop proceso
	 jmp salir
imprimir_msjserie:
	mov eax,4
	mov ebx,2
	mov ecx,msj1
	mov edx,lenmsj1
	int 80h
	ret
imprimir_serie:
	mov eax,4
	mov ebx,2
	mov ecx,num1
	mov edx,1	
	int 80h
	ret
salto:
	mov eax,4
	mov ebx,2
	mov ecx,nueva_linea
	mov edx,1
	int 80h
	ret
salir:
	call salto
	mov eax,1
	int 80h
