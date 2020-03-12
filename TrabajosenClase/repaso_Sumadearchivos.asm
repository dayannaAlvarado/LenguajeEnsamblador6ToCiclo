section .data
    archivo1 db "/home/daya/Documentos/Ensamblador/final/UNO.txt",0
    error1 db "Error...Direccion no encontrada",10
    len_error1 equ $- error1

    archivo2 db "/home/daya/Documentos/Ensamblador/final/DOS.txt",0
    error2 db "Error...Direccion no encontrada DOS" ,10
    len_error2 equ $- error2
     resultado db "    "
    len equ $- resultado
    salto db 10,""
section .bss
    texto1 resb 30
    idarchivo1 resb 1

    texto2 resb 30
    idarchivo2 resb 1

section .text
    global _start
_start:
;;;;;;;PRIMER ARCHIVO 
    mov eax, 5 ;5 para leer archivos.. se convoca una subrutina al sistema operati
    mov ebx,archivo1
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
    mov dword [idarchivo1],eax
    ;*********leer archivo
    mov eax,3
    mov ebx,[idarchivo1]
    mov ecx,texto1
    mov edx,30
    int 80h
    ;*********escibir contenido del archivo
   mov eax, 4
    mov ebx, 1
    mov ecx,texto1
    mov edx, 30
    int 80h
    ;jmp salir

;----------ARCHIVO DOS 

    mov eax, 5 ;5 para leer archivos.. se convoca una subrutina al sistema operati
    mov ebx,archivo2
    mov ecx,0
    mov edx,0
    int 80h

    ;******++testear el archivo
    test eax, eax
    jz erro
    ;*******asignar id archivo
    mov dword [idarchivo2],eax
    ;*********leer archivo
    mov eax,3
    mov ebx,[idarchivo2]
    mov ecx,texto2
    mov edx,30
    int 80h
    ;*********escibir contenido del archivo
    mov eax,4
    mov ebx,1
    mov ecx,salto
    mov edx,2
    int 80h


   mov eax, 4
    mov ebx, 1
    mov ecx,texto2
    mov edx, 30
    int 80h
   ; jmp salir

 ;;;SUMAAAA COMPLEJAAA


    mov esi,3 ;direccion
    mov ecx,4
    clc ; operacion sin operando, desactiva el  bit (estado activo)de la bandera carry 
proceso_suma:
  ;*********+suma compleja 
    mov al, [texto1+esi]
    ;mov ah, [n2+esi]
    ;adc al,ah ; adc suma con carry 
  
    adc al,[texto2+esi]
    aaa ;ajusta bcd  , solo trabaja con al
    pushf ;salva los estados de bandera  en pila
    or al,30h  ; se convierte en aas
    popf ;recupera los etsado sde la bandera 
    mov [resultado+esi],al
    
    dec esi
    loop proceso_suma
imprimir:
     mov eax,4
     mov ebx,1
     mov ecx,resultado
     mov edx,len
     int 80h

     mov eax,1
     int 80h

    ;*******************cerrar el archivoSs********
    mov eax,6
    mov ebx,[idarchivo1]
    mov ecx,0
    mov edx,0
    int 80h

     mov eax,6
    mov ebx,[idarchivo2]
    mov ecx,0
    mov edx,0
    int 80h
erro:
    mov eax, 4
    mov ebx, 1
    mov ecx,error1
    mov edx, len_error1
    int 80h
    
salir:
    mov eax,1
    int 80h