section .text
        global _start

_start:
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, len1
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg2
        mov edx, len2
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, msg3
        mov edx, len3
        int 0x80

        mov eax, 1
        int 0x80

section .data
        msg1 db 'I came,', 0xa
        len1 equ $ - msg1

        msg2 db 'I saw,', 0xa
        len2 equ $ - msg2

        msg3 db 'I conquered.', 0xa
        len3 equ $ - msg3