section .text
        global _start

_start:
        xor eax, eax
        mov eax, [oddNum]           ;change between the two initialized variable to test even and odd numbers
        test eax, 1
        jz even
        jnz odd

even:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgEven
        mov edx, lenE
        int 0x80

        mov eax, 1
        int 0x80
odd:
        mov eax, 4
        mov ebx, 1
        mov ecx, msgOdd
        mov edx, lenO
        int 0x80
        
        mov eax, 1
        int 0x80

section .data
        evenNum dd 4                ;use to test the print out of an even number
        oddNum dd 9                 ;use to test the print out of an odd number
        msgEven db 'even', 0xa
        lenE equ $ - msgEven
        msgOdd db 'odd', 0xa
        lenO equ $ - msgOdd