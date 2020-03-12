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
	mensaje db "El resultado de la suma es: ",10 ;=oxa new line
	len equ $-mensaje
	mensaje1 db "ingrese el primer numero ",10 ;=oxa new line
	len1 equ $-mensaje1
	mensaje2 db "ingrese el segundo numero ",10 ;=oxa new line
	len2 equ $-mensaje2
section .bss
	n1 resb 1
	n2 resb 1
	suma resb 1
section .text
	global _start
_start:
;***********************primer numero****************	
	escribir mensaje1, len1
	leer n1, 2
;**********************segundo numero****************
	escribir mensaje2, len2
	leer n2, 2
;*********************proceso de suma***************
	mov ax,[n1]
	mov bx,[n2]
	sub ax,'0'
	sub bx,'0'
	add ax,bx
	add ax,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		   ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [suma],ax
;*********************imprime la suma **************
	escribir mensaje, len
	escribir suma, 1

	mov eax,1
	int 80H
