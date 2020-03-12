;macro
%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro

%macro leer 2
	mov eax,3
	mov ebx,0
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro


section .data
	msj1 db "Ingrese el primer numero: " ;=oxa new line
	lenmsj1 equ $-msj1

	msj2 db "Ingrese el segundo numero: " ;=oxa new line
	lenmsj2 equ $-msj2


	msjsuma db "El resultado de la suma  es: " ;=oxa new line
	lensum equ $-msjsuma

	msjresta db 10,"el resultado de la resta es: ";=oxa new line
	lenrest equ $-msjresta

	msjmul db 10,"El resultado de la multiplicacion  es: " ;=oxa new line
	lenmul equ $-msjmul

	msjcociente db 10,"el resultado de la division es: ";=oxa new line
	lencociente equ $-msjcociente
	msjresiduo db 10,"el resultado del reeiduo de  la division es: ";=oxa new line
	lenresiduo equ $-msjresiduo

	new_line db 10,"" 	
section .bss
	
	n1 resb 1
	n2 resb 1
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	division resb 1
	residuo resb 1
section .text
	global _start
_start:
;***********************primer numero****************	
	escribir msj1, lenmsj1
	leer n1, 2
;**********************segundo numero****************
	escribir msj2, lenmsj2
	leer n2, 2
;*********************proceso de suma***************
jmp dividir
sumar:
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	add al,bl
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [suma],al
	escribir msjsuma, lensum
	escribir suma, 1
	escribir new_line,1
	jmp multiplicar
;*********************proceso de resta***************
restar:
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	sub al,bl
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [resta],al
	escribir msjresta, lenrest
	escribir resta, 1
	escribir new_line,1
	jmp sumar
;*********************proceso de multiplicacion***************
multiplicar:
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [multiplicacion],al
	escribir msjmul, lenmul
	escribir multiplicacion, 1
	escribir new_line,1
	jmp salir
;*********************proceso de division***************
dividir:
	mov al,[n1]
	mov bl,[n2]
	sub al,'0'
	sub bl,'0'
	div bl

	add al,'0'
	mov [division],al
	add ah,'0'
	mov [residuo],ah
	escribir msjcociente, lencociente
	escribir division, 1
	
	escribir msjresiduo, lenresiduo
	escribir residuo, 1
		
	escribir new_line,1
	jmp restar

salir:
	mov al,1
	int 80H
	
	
	
	
	
	
	
