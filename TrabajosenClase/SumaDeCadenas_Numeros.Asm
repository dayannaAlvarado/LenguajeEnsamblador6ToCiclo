section .data
    n1 db "3277"
    n2 db "2566"
    resultado db "    "
    len equ $- resultado
section .text
    global _start
_start:
    mov esi,3 ;direccion
    mov ecx,4
    clc ; operacion sin operando, desactiva el  bit (estado activo)de la bandera carry 
proceso_suma:
  ;*********+suma compleja 
    mov al, [n1+esi]
    ;mov ah, [n2+esi]
    ;adc al,ah ; adc suma con carry 
  
    adc al,[n2+esi]
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
