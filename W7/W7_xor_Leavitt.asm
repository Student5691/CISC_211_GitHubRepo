section .text
        global _start

_start:
                                ;observe these steps in gdb to confirm
        mov eax, 15             ;place 15 into eax to start
        mov [init_eax], eax     ;store 15 into the init_eax variable
        xor eax, eax            ;clear eax reg via xor
        mov [after_xor], eax    ;store the eax value after the xor operation into the after_xor variable, should be 0
        mov ebx, [init_eax]     ;check that the init_eax variable is indeed 15 by moving it into ebx and observing in gdb
        mov ebx, [after_xor]    ;check that the after_xor variable is indeed 0 by moving it into ebx and observing in gdb

        mov eax, 1
        int 0x80

section .bss
        init_eax resb 1
        after_xor resb 1