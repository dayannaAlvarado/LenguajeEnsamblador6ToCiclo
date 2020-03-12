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
	ruta db  "ingrese la ruta"
	lenruta equ $- ruta

	msj db  "Carpeta o directotio creado"
	len equ $- msj
    path db "/home/daya/Documentos/Ensamblador/DEBER",0
    lee db  "Escriba el texto dentro del archivo",10
    lenlee equ $- lee
    archivo db "/home/daya/Documentos/Ensamblador/DEBER/notass.txt",0
    error db "Error...Direccion no encontrada",10
    len_error equ $- error
section .bss
	;path resb "/home/daya/DEBER"
    texto resb 35
    idtexto resb 1
section .text
	global _start
_start:
	;escribir ruta, lenruta
	;leer path,50

	mov eax,[path]

	mov eax, 39  ;servicio para crear un directorio
	mov ebx, path ;enviamos la ruta del servicio
	mov ecx, 0x1FF; tipo de permisos (777)
    mov edx,2
	int 80h

	escribir msj, len

    escribir lee,lenlee

    mov eax,3
    mov ebx,1 ;puede ser el 2
    mov ecx,texto
    mov edx,35
    int 80h 

    mov eax,8
    mov ebx,archivo
    mov ecx,1
    mov edx,777h ;0x1FF
    int 80h
    test eax,eax
    jz erro

    mov dword [idtexto],eax

    mov eax, 4
    mov ebx, [idtexto]
    mov ecx,texto
    mov edx,35
    int 80h
    jmp salir
erro:
    mov eax, 4
    mov ebx, 1
    mov ecx,error
    mov edx, len_error
    int 80h
    
salir:
    mov eax,1
    int 80h