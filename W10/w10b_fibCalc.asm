section .text
        global _start

_start:
        xor eax, eax                    ;clear regs
        xor ebx, ebx
        xor edx, edx
        xor ecx, ecx                    
        mov ecx, 8                      ;num of the dersired fib sequence value, minus 2
                                        ;Minus 2 becasue the first 2 vals are hard-coded in
                                        ;as fibNminus2 and fibNminus1 for use in initial
                                        ;calculations
        mov eax, [fibNminus2]           ;move first two numbers of the fib sequence into regs
        mov ebx, [fibNminus1]

fibCalc:
        add eax, ebx                    ;add the previous 2 fib numbers to get the next one
        mov edx, eax                    ;hold the new fib number in edx
        mov eax, ebx                    ;replace the minus 2 fib num with the minus 1 fib num
        mov ebx, edx                    ;replace the minus 1 fib num with the new fib num

        loop fibCalc                    ;if exc is not 0, loop back to "fibCalc"

        mov [fibN], edx                 ;store the final fib number in varaible: fibN

        mov eax, 4                      ;print sequence, should print ascii char of 34 to terminal
        mov ebx, 1
        mov ecx, fibN
        mov edx, 1
        int 0x80

        mov eax, 4                      ;print sequence for a new line char
        mov ebx, 1
        mov ecx, newLine
        mov edx, 1
        int 0x80

        mov eax, 1                      ;terminate the program
        int 0x80

section .data
        fibNminus2 dd 0                 ;initialized with the 1st num of the fib sequence
        fibNminus1 dd 1                 ;initialized with the 2nd num of the fib sequence
        newLine dd 10                   ;ascii value for the new line char
section .bss
        fibN resb 4                     ;holds the final calculated fib num