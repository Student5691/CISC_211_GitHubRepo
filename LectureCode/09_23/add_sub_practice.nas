section . text:
        global _start

_start: 
        mov eax, a
        mov ebx, b
        add eax, ebx
        mov ebx, c
        sub eax, ebx
        mov ebx, d
        add eax, ebx

        mov eax, 1
        int 0x80

section .data
        a dd 45
        b dd 65
        c dd 12
        d dd 100

section .bss
        result resb 2