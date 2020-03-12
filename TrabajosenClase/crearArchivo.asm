%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro
section .data
	msj db 10, "Archivo creado",10
	len equ $- msj
	path db '/home/daya/Documentos/Ensamblador/archivito.txt',0
	lenpath equ $ - path
section .text
	global _start
_start:
	mov eax, 8  ;servicio para crear un directorio
	mov ebx, path ;enviamos la ruta del servicio
	mov ecx, 0x1FF; tipo de permisos (777)
	int 80h

	escribir msj, len
	mov eax,1
	int 80h
