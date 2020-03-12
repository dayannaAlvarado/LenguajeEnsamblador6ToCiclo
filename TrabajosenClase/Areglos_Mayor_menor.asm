%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "Ingrese 6 numeros",10
    tam equ $-msj

    msj1 db "El numero mayor es: ",10
    tam1 equ $-msj1

    msj2 db "Listado: ",10
    tam2 equ $-msj2

    num_mayor db " El numero mayor es: "
    lenmayor equ $-num_mayor

    num_menor db " EL numero menor es: "
    lenmenor equ $-num_menor

    salto db "",10
    lensalto equ $-salto
    
    arreglo db 0,0,0,0,0,0
    lenarreglo equ $-arreglo

section .bss
    numero resb 2
    mayor resb 2
    menor resb 2

section .text
    global _start

_start:
    imprimir msj, tam

  
    mov esi, arreglo
    mov edi, 0

lectura:
    leer numero, 2

    
    mov al, [numero]
    sub al, '0'
    mov [esi], al

    add esi, 1
    add edi, 1

    
    cmp edi, lenarreglo
    jb lectura

    sub esi, lenarreglo
    mov edi, 0

    mov al, 0
    mov [mayor], al

    mov al, [esi]
    mov [menor], al

    imprimir msj2, tam2

escribir:
    mov al, [esi]

    mov bl, [mayor]
    mov cl, [menor]

    cmp al, bl 
    jg asignar_mayor

    cmp cl, al
    jg asignar_menor
    
    add al, '0'
    mov [numero], al
    imprimir numero, 2 

    add esi, 1
    add edi, 1

    cmp edi, lenarreglo
    jb escribir

    mov al, [mayor]
    add al, '0'

    mov [mayor], al

    mov al, [menor]
    add al, '0'

    mov [menor], al    

    imprimir num_mayor, lenmayor
    imprimir mayor,2

    imprimir salto, 2

    imprimir num_menor, lenmenor
    imprimir menor,2

    imprimir salto, 2

    jmp salida

asignar_mayor:
    mov [mayor], al
    jmp escribir

asignar_menor:
    mov [menor], al
    jmp escribir

salida:
    mov eax, 1
    int 80h
