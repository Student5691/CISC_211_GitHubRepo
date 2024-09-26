section .text
        global _start

_start:
        xor eax, eax
        mov ebx, [var1]
        sub eax, ebx
        mov dl, [var2]
        imul dl
        add eax, [var3]
        mov [result], eax

        mov eax, 1
        int 0x80

section .data
        var1 dd 5
        var2 dd 7
        var3 dd 9

section .bss
        result resb 4