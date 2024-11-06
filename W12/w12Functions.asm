_evenOrOdd:
        push ebp                        ;sotre ebp in the stack
        mov ebp, esp                    ;saved current stack pointer to the base pointer
        mov eax, DWORD[ebp+8]           ;set eax to the argument pushed to the stack
        test eax, 1                     ;test for even or odd
        jz even                         ;if zero flag is raised, num is even, jump to even print sequence
        jnz odd                         ;if zero flag is not raised, num is odd, jump to odd print sequence

even:
        mov eax, 4                      ;print sequence for even message
        mov ebx, 1
        mov ecx, msgEven
        mov edx, lenE
        int 0x80                        ;kernel call
        jmp evenOddExit                 ;begin exitting the function

odd:
        mov eax, 4                      ;print sequence for odd message
        mov ebx, 1
        mov ecx, msgOdd
        mov edx, lenO
        int 0x80                        ;kernel call
        jmp evenOddExit                 ;begin exitting the function

evenOddExit:
        leave                           ;function exit sequence, to include resetting stack base pointer
        ret

section .text
        global _start

_start:
        xor eax, eax                    ;zero eax register
        mov eax, [oddNum]               ;change between the two initialized variable to test even and odd numbers
        push eax                        ;store eax in the stack, this will be the argument for the function
        call _evenOrOdd                 ;call the function

        mov eax, 1                      ;exit sequence
        int 0x80

section .data
        evenNum dd 4                    ;use to test the print out of an even number
        oddNum dd 9                     ;use to test the print out of an odd number
        msgEven db 'even', 0xa          ;message to print if even num is used
        lenE equ $ - msgEven            ;length of even num message
        msgOdd db 'odd', 0xa            ;message to print if odd num is used
        lenO equ $ - msgOdd             ;length of odd num message