section .text
        global _start

_start:
        mov eax, [stu01]
        add eax, [stu02]
        add eax, [stu03]
        add eax, [stu04]
        add eax, [stu05]
        mov dl, [numOfStu]
        div dl
        mov [mean], eax

        mov eax, 1
        int 0x80

section .data
        stu01 dd 60
        stu02 dd 70
        stu03 dd 90
        stu04 dd 40
        stu05 dd 65
        numOfStu dd 5

section .bss
        mean resb 4