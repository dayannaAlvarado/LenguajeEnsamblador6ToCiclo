%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
%macro leer 2
	mov eax,3
	mov ebx,0
	mov ecx,%1
	mov edx,%2
	int 80H
%endmacro


section .data
	ruta db 10, "ingrese la ruta",10
	lenruta equ $- ruta

	msj db 10, "Carpeta o directotio creado",10
	len equ $- msj

section .bss
	path resb 1

section .text
	global _start
_start:
	escribir ruta, lenruta
	leer path,50

	mov eax,[path]

	mov eax, 39  ;servicio para crear un directorio
	mov ebx, path ;enviamos la ruta del servicio
	mov ecx, 0x1FF; tipo de permisos (777)
	int 80h

	escribir msj, len
	mov eax,1
	int 80h
