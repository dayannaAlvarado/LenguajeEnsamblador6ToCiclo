section .data
    n1 db "518"
    n2 db "197"
    resultado db "    "
    len equ $- resultado
section .text
    global _start
_start:
    mov esi,2 ;direccion
    mov ecx,3
    clc ; operacion sin operando, desactiva el  bit (estado activo)de la bandera carry 
proceso_resta:
  ;*********+resta compleja 
    mov al, [n1+esi]
   

    sbb al,[n2+esi]; para restar
    aas ;ajusta bcd  , solo trabaja con al
    pushf ;salva los estados de bandera  en pila
    or al,30h  ; se convierte en aas
    popf ;recupera los etsado sde la bandera 
    mov [resultado+esi],al
    
    dec esi
    loop proceso_resta
imprimir:
     mov eax,4  
     mov ebx,1
     mov ecx,resultado
     mov edx,len
     int 80h

     mov eax,1
     int 80h
