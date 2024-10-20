section .text
        global _start

_start:
        mov eax, [var3]
        sub eax, [var2]
        mov [temp], eax
        mov eax, [var1]
        add eax, 2
        mov dl, [temp]
        div dl
        mov [result], eax

        mov eax, 1
        int 0x80

section .data
        var1 dd 10
        var2 dd 4
        var3 dd 8

section .bss
        result resb 4
        temp resb 4