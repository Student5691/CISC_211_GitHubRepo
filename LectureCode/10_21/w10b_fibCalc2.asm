section .text
        global _start

_start:
        xor ecx, ecx                    ;clear ecx reg
        mov ecx, 8                      ;num of the dersired fib sequence value minus 2, N
                                        ;Minus 2 becasue the first 2 vals are hard-coded in

top:
        xor eax, eax                
        xor ebx, ebx
        xor edx, edx
        mov eax, [fibNminus1]       
        mov ebx, [fibNminus2]   
        add eax, ebx
        mov [fibN], eax  

        mov eax, [fibNminus1]              
        mov [fibNminus2], eax
        mov eax, [fibN]
        mov [fibNminus1], eax
        loop top                 

        mov eax, 4
        mov ebx, 1
        mov ecx, fibN                   ;should print a single quotes character, " , to the terminal
        mov edx, 1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newLine
        mov edx, 1
        int 0x80

        mov eax, 1       
        int 0x80

section .data
        fibNminus2 dd 0                 ;initialized with the 1st 2 nums of the fib sequence
        fibNminus1 dd 1
        newLine dd 10
section .bss
        fibN resb 4                     ;should end up being decimal number 43, which is ascii character "