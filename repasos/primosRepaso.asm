section .data
		msj db 'Ingrese la cantidad de numeros primos que desea presentar',10
		lenmsj equ $- msj
		
		nueva_linea db 10,''
		msj1 db 'Numeros primos:'
		lenmsj1 equ $- msj1
		
section .bss
		numero resb 1
        a resb 1
        b resb 2
section .text
		global _start
_start:
        call imp_mens
        call leer
        mov ecx,[numero]
        sub ecx,'0'
        mov al,0
        push ecx
        push al
        mov edx,0
proceso:
        mov ecx,al
        push ecx
        mov bl,al
        div al 
        cmp ah,0
        je comparar
        pop ecx
        loop proceso 
        pop al
        pop ecx
comparar:
        inc edx 

        loop proceso
        
imprimir:
        mov ecx
        mov eax,4
        mov ebx,2
        mov ecx,msj
        mov edx,lenmsj
        int 80h

leer:   
        mov eax,3
        mov ebx,1
        mov ecx,numero
        mov edx,1
        int 80h
        ret
            
imp_mens:
        mov eax,4
        mov ebx,2
        mov ecx,msj
        mov edx,lenmsj
        int 80h
        ret

imp_linea:
        mov eax,4
        mov ebx,2
        mov ecx,nueva_linea
        mov edx,1
        int 80h
        ret


salir:
        call imp_linea
        mov eax,1
        int 80h