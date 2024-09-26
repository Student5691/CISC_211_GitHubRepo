section .text
        global _start

_start:
        xor eax, eax
        mov eax, [var1]
        mov dl, 2
        mul dl

        xor eax, eax
        mov dl, [var2]
        sub dl, 3
        div dl
        mov [result], eax

        mov eax, 1
        int 0x80

section .data
        var1 dd 10
        var2 dd 8

section .bss
        result resb 4