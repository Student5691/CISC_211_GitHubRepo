section .text
        global _start

_start:
                                ; open the file for writing
        mov eax, 5
        mov ebx, filename
        mov ecx, 2
        int 0x80
        mov [fd_out], eax

                                ; find end of file
        mov eax, 19             ; call sys_lseek
        mov ebx, [fd_out]
        mov ecx, 0              ; offset is zero to seek to the end of the file in conjunction with edx holding 2
        mov edx, 2              ; i.e. 0 bytes (ecx) away from the end of the file
        int 0x80

                                ; append first string to the end of the file
        mov eax, 4
        mov ecx, string1
        mov edx, string1_len
        int 0x80

                                ; write new line to file
        mov eax, 4
        mov ecx, newline
        mov edx, 1
        int 0x80

                                ; append second string to the end of the file
        mov eax, 4
        mov ecx, string2
        mov edx, string2_len
        int 0x80

                                ; write new line to file
        mov eax, 4
        mov ecx, newline
        mov edx, 1
        int 0x80

                                ; close file
        mov eax, 6
        int 0x80

        mov eax,1
        xor ebx, ebx
        int 0x80

section .data
        filename db 'quotes.txt', 0h
        string1 db 'Better three hours too soon than a minute too late.', 0h
        string1_len equ $ - string1
        string2 db 'No legacy is so rich as honesty.', 0h
        string2_len equ $ - string2
        newline db 0xA

section .bss
        fd_out resb 1
