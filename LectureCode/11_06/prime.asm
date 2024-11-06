section .text
        global _start

_numberchecker:
        push ebp
        mov ebp, esp
        sub esp, 4

        mov eax, DWORD[ebp+8]
        leave
        ret

_start:
        push 10
        call _numberchecker

        mov eax, 1
        int 0x80