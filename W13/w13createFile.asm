section .text
        global _start

_start:
                                ; create file
        mov ecx, 0711o          ; set all permissions to read, write, execute (octal format)
        mov ebx, filename       ; name of the file to be created
        mov eax, 8              ; SYS_CREAT (kernel opcode 8)
        int 0x80                ; call kernel

                                ; open the file for writing
        mov eax, 5
        mov ebx, filename
        mov ecx, 1
        mov edx, 0777o
        int 0x80
        mov [fd_out], eax

                                ; write first string to file
        mov eax, 4
        mov ebx, [fd_out]
        mov ecx, string1
        mov edx, string1_len
        int 0x80

                                ; write new line to file
        mov eax, 4
        mov ecx, newline
        mov edx, 1
        int 0x80

                                ; write second string to file
        mov eax, 4
        mov ecx, string2
        mov edx, string2_len
        int 0x80

                                ; write new line to file
        mov eax, 4
        mov ecx, newline
        mov edx, 1
        int 0x80

        mov eax,1
        xor ebx, ebx
        int 0x80

section .data
        filename db 'quotes.txt', 0h
        string1 db 'To be, or not to be, that is the question.', 0
        string1_len equ $ - string1
        string2 db 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', 0
        string2_len equ $ - string2
        newline db 0xA

section .bss
        fd_out resb 1
