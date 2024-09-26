section .text
        global _start

_start:
        xor eax, eax
        mov eax, [var1]
        add eax, [var2]
        add eax, [var3]
        add eax, [var4]
        mov [result], eax
        mov eax, 1
        int 0x80

section .data
        var1 dd 5
        var2 dd 7
        var3 dd 9
        var4 dd 11

section .bss
        result resb 2