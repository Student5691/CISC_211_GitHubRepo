section .text
        global _start

_start:
        xor eax, eax            ;clear registers
        xor ebx, ebx
        xor edx, edx
        xor ecx, ecx                    
        mov ecx, [fact]         ;set number of the dersired factorial calculation, 5 in this case
        dec ecx                 ;initial decrement since eax will hold the starting value, 5
        mov eax, [fact]         ;set eax to the first value in the factorial sequence

factorialCalc:
        mul ecx                 ;multiple value in eax by the by the next value in the factorial sequence
        loop factorialCalc      ;decrement ecx and loop to the multiply operation until ecx is 0, then continue

        mov [result], eax       ;store the final result in the declared variable

        mov eax, 4              ;print sequence for the result, if printable, 5! = 120 = "x"
        mov ebx, 1
        mov ecx, result
        mov edx, 1
        int 0x80

        mov eax, 4              ;print sequence for a new line character
        mov ebx, 1
        mov ecx, newLine
        mov edx, 1
        int 0x80

        mov eax, 1              ;terminate the program
        int 0x80

section .data
        newLine dd 10           ;ascii value for the new line char
        fact dd 5               ;value decided on by the user/programmer
section .bss
        result resb 4           ;variable to hold the result of the factorial calculation