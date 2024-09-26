section .text
        global _start

_start:
        xor eax, eax
        mov ebx, [var1]
        sub eax, ebx
        mov dl, 10
        imul dl
        mov [result], eax

        mov eax, 1
        int 0x80

section .data
        var1 dd 6

section .bss
        result resd 1