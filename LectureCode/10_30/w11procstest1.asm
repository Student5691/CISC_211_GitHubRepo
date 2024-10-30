section .text
        global _start

_start:
        mov eax, [res]

main:
        mov ecx, res
        call output
        mov eax, [res]
        inc eax
        mov [res], eax
        cmp eax, 91
        jl main
        call exit

output:
        mov edx, 1              ;output length
        mov ebx, 1              ;stdout
        mov eax, 4              ;system call (sys_write)
        int 0x80                ;interrupt kernel
        mov eax, 4              ;dont need to reset ebx and edx, but after int 0x80, eax is set to 1, so we must reset to 4 for another print call
        mov ecx, newline
        int 0x80
        ret

exit:
        mov eax,1
        int 0x80

segment .data
        res dd 65
        newline dd 10