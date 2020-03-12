;***************************************************Dayanna Alvarado,3 de Febrero, Evaluacion de PILAS
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro leer 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
section .data
    msj db 10,"Ingrese un numero: "
    len equ $-msj
  
    msj_enter db 10,""
section .bss
    n1 resb 2
    n2 resb 2
    n3 resb 2
    n4 resb 2
    n5 resb 2

section .text
    global _start:
_start:
	escribir msj,len
	leer n1,2
	escribir msj,len
	leer n2,2
	escribir msj,len
	leer n3,2
	escribir msj,len
	leer n4,2
	;escribir msj,len
	;leer n5,2
	mov eax,[n1]
	mov ebx,[n2]
	mov ecx,[n3]
	mov edx,[n4]
	sub eax,'0'
	sub ebx,'0'
	sub ecx,'0'
	sub edx,'0'
	
	;jmp mayora
ayb:
	cmp eax,ebx
	jg mayoreax1
	jmp byc
ayc:
	cmp eax,ecx
	jg mayoreax2
	jmp cyd
ayd:
	cmp eax,edx
	jg mayora
	jmp mayord
byc:
	cmp ebx,ecx
	jg mayorebx1
	jmp cyd
cyd:
	cmp ecx, edx
	jg mayorc
	jmp mayord
mayoreax1:
	cmp eax,ecx
	jg mayoreax2
	cmp ecx,edx
	jg mayorc
mayoreax2:
	cmp eax,edx
	jg mayora
	jmp mayord
mayorebx1:
	cmp ebx,edx
	jg mayorb
	jmp mayord
mayorb:
	push eax
	push ebx
	push ecx
	push edx
	add ebx,'0'
	mov [n2],ebx
	escribir n2,1
	escribir msj_enter,1
	pop edx
	pop ecx
	pop ebx
	pop eax
	jmp cyd
	;jmp mayorc
mayord:
	push eax
	push ebx
	push ecx
	push edx
	add edx,'0'
	mov [n4],edx
	escribir n4,1
	escribir msj_enter,1
	pop edx
	pop ecx
	pop ebx
	pop eax
	jmp salir
mayorc:
	push eax
	push ebx
	push ecx
	push edx
	add ecx,'0'
	mov [n3],ecx
	escribir n3,1
	escribir msj_enter,1
	pop edx
	pop ecx
	pop ebx
	pop eax
	jmp mayord
mayora:
	push eax
	push ebx
	push ecx
	push edx
	add eax,'0'
	mov [n1],eax
	escribir n1,1
	escribir msj_enter,1
	pop edx
	pop ecx
	pop ebx
	pop eax
	jmp byc
	;jmp mayorb
salir:
	mov eax,1
	int 80h
	
