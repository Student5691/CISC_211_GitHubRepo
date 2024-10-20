section .text
        global _start

_start:
        mov eax,0       ; reset eax to 0
label:
        mov [temp], eax
        ;push eax       ;puts eax value to the top of the stack, use instead of the temp variable to save teh value of eax

        mov eax, 4
        mov ebx, 1
        mov ecx, temp
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newLine
        mov edx, 1
        int 0x80

        mov eax, [temp]
        ;pop eax        ;restores eax value from the top of the stack, use instead of the temp varaible to reset eax value
        inc eax
        cmp eax,127

        jl label        ;jump if less

        mov eax,1
        int 0x80

section .bss
        temp resb 2

section .data
        newLine dd 10