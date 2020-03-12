section .data
    archivo db "/home/daya/Documentos/Ensamblador/hola.txt",0
    error db "Error...Direccion no encontrada",10
    len_error equ $- error
section .bss
    texto resb 30
    idarchivo resb 1

section .text
    global _start
_start:

    mov eax, 5 ;5 para leer archivos.. se convoca una subrutina al sistema operati
    mov ebx,archivo
    mov ecx,0
        ; modos de acceso 
        ;R-only=0
        ;W-only=1
        ;RDWR=2
    mov edx,0
    int 80h
    ;******++testear el archivo
    test eax, eax
    jz erro
    ;*******asignar id archivo
    mov dword [idarchivo],eax
    ;*********leer archivo
    mov eax,3
    mov ebx,[idarchivo]
    mov ecx,texto
    mov edx,30
    int 80h
    ;*********escibir contenido del archivo
    mov eax, 4
    mov ebx, 1
    mov ecx,texto
    mov edx, 30
    int 80h
    jmp salir
    ;*******************cerrar el archivo********
    mov eax,6
    mov ebx,[idarchivo]
    mov ecx,0
    mov edx,0
    int 80h
erro:
    mov eax, 4
    mov ebx, 1
    mov ecx,error
    mov edx, len_error
    int 80h
    
salir:
    mov eax,1
    int 80h