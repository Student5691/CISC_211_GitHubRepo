section .text
        global _start

_start:
        mov ax, 8
        mov bl, 3
        div bl

        mov eax, 1
        int 0x80