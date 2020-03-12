section .data
	mensaje db "El resultado de la suma es: ",10 ;=oxa new line
	len equ $-mensaje

section .bss
	suma resb 1
section .text
	global _start
_start:
	mov eax,2
	mov ebx,4
	add eax,ebx
	add eax,'0' ;para transformar de numero a cadena se suma  cero"0"--> registro,'0'
		    ;para transformar de cadena a numero se resta  cero"0"--> registro,'0'

	mov [suma],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,mensaje
	mov edx,len
	int 80H

	mov eax,4
	mov ebx,1
	mov ecx,suma
	mov edx,1		
	int 80H
	

	
	mov eax,1
	int 80H
