section .text
        global _start

_start:
        mov al, [var1]
        add al, [var2]
        mov dl, [var3]
        mul dl
        mov [var4], al

        mov eax, 1
        int 0x80

section .bss
        var4 resb 2

section .data
        var1 dd 5
        var2 dd 2
        var3 dd 3