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

	msj db "Elija una opcion, 1-->Area de cuadrado, 2-->Area de circulo, 3-->Area de Rectangulo, 0-->salir     " ;=oxa new line
	lenmsj equ $-msj
	
	msjcuadrado db "Ingrese el lado del cuadrado: " ;=oxa new line
	lenmsj1 equ $-msjcuadrado

	msjradio db "Ingrese el radio del circulo: " ;=oxa new line
	lenmsj2 equ $-msjradio
	
	msjbase db "Ingrese la base del rectangulo: " ;=oxa new line
	lenmsj3 equ $-msjbase
	
	msjaltura db "Ingrese la altura del rectangulo: " ;=oxa new line
	lenmsj4 equ $-msjaltura
	
	msjareacuadrado db "El resultado del Area del Cuadrado   es: " ;=oxa new line
	lenareacuadrado equ $-msjareacuadrado

	msjareacirculo db 10,"el resultado del Area del Circulo es: ";=oxa new line
	lenareacirculo equ $-msjareacirculo
	
	msjarearectangulo db 10,"el resultado del Area del Rectangulo es: ";=oxa new line
	lenarearectangulo equ $-msjarearectangulo
	
	new_line db 10,"" 
section .bss
	opcion resb 1
	n1 resb 1
	n2 resb 1
	n3 resb 1
	n4 resb 1

	areacuadrado resb 1
	areacirculo resb 1
	arearectangulo resb 1
	
section .text
	global _start
_start:
;**********************opcion****************
volver:
	escribir msj, lenmsj
	leer opcion, 2

;*********************comparaciones***********
	mov ah,[opcion]
	sub ah,'0'
	cmp ah,1
	 je cuadrado
	cmp ah,2
	 je circulo
	cmp ah,3
	 je rectangulo
	cmp ah,0
	 je salir

cuadrado:

;***********************lado****************	
	escribir msjcuadrado, lenmsj1
	leer n1, 2
	mov al,[n1]
	mov bl,[n1]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [areacuadrado],al
	escribir msjareacuadrado, lenareacuadrado
	escribir areacuadrado, 1
	escribir new_line,1
	jmp volver

circulo:
;***********************radio****************	
	escribir msjradio, lenmsj2
	leer n2, 2
	mov al,3
	mov bl,[n2]
	sub bl,'0'
; math.pow
	mul bl
	mul bl	
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [areacirculo],al
	escribir msjareacirculo, lenareacirculo
	escribir areacirculo, 1
	escribir new_line,1
	jmp volver

rectangulo:

	escribir msjbase, lenmsj3
	leer n3, 2
	escribir msjaltura, lenmsj4
	leer n4, 2

	mov al,[n3]
	mov bl,[n4]
	sub al,'0'
	sub bl,'0'
	mul bl	
	add al,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [arearectangulo],al
	escribir msjarearectangulo, lenarearectangulo
	escribir arearectangulo, 1
	escribir new_line,1
	jmp volver

salir:
	mov al,1
	int 80H
	
