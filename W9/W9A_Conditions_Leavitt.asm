; Mason Leavitt
; CISC 211
; W9 Activity: Conditionals
; This program prints every odd items for values from 33-53 (0-20 plus an offset of 33, 33 chosen so that ascii charaters that are visible are printed to the terminal)
; For explicitly only 0-20, remove the asciiOffset (lines 16 and 53), and change 54 to 21 (line 19)

section .text
        global _start

section .data
        asciiOffset dd 33       ; selected 33 as the ascii offset becasue 33 is the first non-whitespace, printable character, 32 is a space: " "
        newLine dd 10           ; new line ascii value
        val dd 0                ; starting val to be used for this program, 0 and 20 will result in an odd number (+33) and thus 11 items will be printed to the terminal (ascii characters associated with 33, 35, 37, ... , 53)
                                ; NOTE: if different variable sizes are used, such as db, the a registers on line 14 and 15 must be al, not eax, to properly accomodate the reduced size of these variables
                                ; db = 1 byte = al reg          dw = 2 byte = ax reg            dd = 4 byte = eax reg

_start:
        xor eax, eax            ; zero out eax, ebx, ecx, edx registers
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx
        mov eax, [val]          ; move [val] in eax
        add eax, [asciiOffset]  ; add the ascii offset to generate a printable character (other than space) so that there is a visible output (interpreted "generate" as printing something to terminal)

compareValMagnitude:
        cmp eax, 54             ; 20 is max value for this problem so 20+33=53, thus check if value is 54
        jl checkValForEvenOdd   ; if less than 54, jump to checkValForEvenOdd block
        jmp exit                ; if we get past the jump if less than command by eax being equal to or greater than 54, jump to exit block

checkValForEvenOdd:
        test eax, 1             ; test operator to check eveen or odd status
        jnz odd                 ; jump to odd block if the number in eax is odd
        inc eax                 ; if value is even, increment eax by 1
        jmp compareValMagnitude ; jump back to the compare block

odd:
        mov [val], eax          ; store current eac value into [val]

        mov eax, 4              ; call for system write
        mov ebx, 1              ; specifying standard output
        mov ecx, val            ; specify what to print, the ascii character associated with [val]'s decimal value in this case
        mov edx, 1              ; specify length of the message, will always be 1 byte for this range of values
        int 0x80                ; call kernel

        mov eax, 4              ; call for system write
        mov ebx, 1              ; specifying standard output
        mov ecx, newLine        ; print a new line
        mov edx, 1              ; length of new line is 1 byte
        int 0x80                ; call kernel

        mov eax, [val]          ; return the value into the eax register
        inc eax                 ; increment eax by 1
        jmp compareValMagnitude ; jump to the compare block

exit:
        mov eax, 1              ; exit the program
        int 0x80