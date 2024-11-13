section .text
        global _start

_start:
        xor eax, eax                    ;zero eax, ebx, and ecx registers
        xor ebx, ebx
        xor ecx, ecx
        mov eax, [x]                    
        push eax                        ;push x value to the stack (2)
        mov eax, [y]
        push eax                        ;push y value to the stack (3)
        mov eax, [z]
        push eax                        ;push z value to the stack (4)
        call _sum                       ;call the function

        mov eax, 1                      ;exit sequence
        int 0x80

_sum:
        push ebp                        ;store ebp in the stack
        mov ebp, esp                    ;save current stack pointer to the base pointer
        xor eax, eax                    ;precautionary clearing of eax register
        mov eax, DWORD[ebp+8]           ;set eax to z value, from the stack
        mov ebx, DWORD[ebp+12]          ;set ebx to y value, from the stack
        mov ecx, DWORD[ebp+16]          ;set ecx to x value, from the stack
        add eax, ebx                    ;add eax to ebx, store in eax
        add eax, ecx                    ;add eax to ecx, store in eax
        mov [result], eax               ;save the sum value in eax to the declared variable, result
        leave                           ;resets ebp and cleans stack
        ret                             ;return with the result in eax

section .data
        x dd 2
        y dd 3
        z dd 4

section .bss
        result resb 4