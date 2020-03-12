%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro lectura 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro


section .bss
		base resb 2
		
section .text
		global _start
_start:
      
proceso:
       
        mov al,2
        mov bl,3
        mul bl
        
imprimir:
       
        add al,'0'
        mov [base],al

        mov eax,4
        mov ebx,1
        mov ecx,base
        mov edx,1
        int 80h
        jmp salir

salir:
        
        mov eax,1
        int 80h