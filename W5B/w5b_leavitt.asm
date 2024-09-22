section .text
        global _start

_start:
        mov eax, [var1]
        mov ebx, [var2]
        add eax, ebx
        mov [result], eax

        mov eax, 1
        int 0x80

section .data
        var1 dd 10
        var2 dd 15

segment .bss
        result resb 4