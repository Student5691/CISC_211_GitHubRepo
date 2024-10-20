; Mason Leavitt
; CISC 211
; W9 Activity: Largest Number/Integer
; This program finds the largest integer number contained within 5 initialized variables
; Numbers are selected in a way such that the largest number is between 33 and 127, the printable ascii characters (except space, " ") and then printed to the terminal

section .text
        global _start

section .bss
        largestNum resb 4       ; will hold the largest integer, num5

section .data
        newLine dd 10
        num1 dd 33
        num2 dd 54
        num3 dd 122             ; largest integer, it will be stored in largestNum and printed to the terminal as "z"
        num4 dd 101
        num5 dd 87

_start:
        xor eax, eax            ; zero out eax, ebx, ecx, edx registers
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx
        mov eax, [num1]         ; store num1 in eax
        cmp eax, [num2]         ; compare eax to num2
        jl num2GreaterThanEax   ; if eax is less than num2, jump to num2GreaterThanEax
        jmp compareToNum3       ; if eax is greater than num2, jump to compareToNum3

num2GreaterThanEax:
        mov eax, [num2]         ; replace eax value with num2
        jmp compareToNum3       ; move on to next comparison

compareToNum3:
        cmp eax, [num3]         ; compare eax to num3
        jl num3GreaterThanEax   ; if eax is less than num3, jump to num3GreaterThanEax
        jmp compareToNum4       ; if eax is greater than num3, jump to compareToNum4

num3GreaterThanEax:
        mov eax, [num3]         ; replace eax value with num3
        jmp compareToNum4       ; move on to next comparison

compareToNum4:
        cmp eax, [num4]         ; compare eax to num4
        jl num4GreaterThanEax   ; if eax is less than num4, jump to num4GreaterThanEax
        jmp compareToNum5       ; if eax is greater than num4, jump to compareToNum5

num4GreaterThanEax:
        mov eax, [num4]         ; replace eax value with num4
        jmp compareToNum5       ; move on to next comparison

compareToNum5:
        cmp eax, [num5]         ; compare eax to num5
        jl num5GreaterThanEax   ; if eax is less than num5, jump to num5GreaterThanEax
        jmp print               ; if eax is greater than num5, jump to print

num5GreaterThanEax:
        mov eax, [num5]         ; replace eax value with num5
        jmp print               ; move on to print block

print:
        mov [largestNum], eax   ; store the eax value, which will be the largest of the 5 integers, into largestNum for later printing
        mov eax, 4              ; call for system write
        mov ebx, 1              ; specifying standard output
        mov ecx, largestNum     ; specify what to print, the ascii character associated with [val]'s decimal value in this case
        mov edx, 1              ; specify length of the message, will always be 1 byte for this range of values
        int 0x80                ; call kernel

        mov eax, 4              ; call for system write
        mov ebx, 1              ; specifying standard output
        mov ecx, newLine        ; print a new line
        mov edx, 1              ; length of new line is 1 byte
        int 0x80                ; call kernel

exit:
        mov eax, 1              ; exit the program
        int 0x80