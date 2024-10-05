section .text
        global _start

_start:
        xor eax, eax
        mov eax, [a]
        mov dl, [b]
        mul dl
        mov [ab], eax
        mov eax, [c]
        mov dl, [d]
        mul dl
        add eax, [ab]
        mov [x], eax

        mov eax, 1
        int 0x80

section .data
        a dd 3
        b dd 5
        c dd 6
        d dd 9

section .bss
        x resb 2
        ab resb 2