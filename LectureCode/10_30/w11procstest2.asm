section .text
        global _start

_start:
        mov ecx, res            ;set ecx to the memory address of the ascii value to be printed 
        call procOutput         ;call procedure output to print the current ascii charcter
        call procNewLine        ;call procedure newLine to print a new line character
        mov eax, [res]          ;set the value of eax to the value of the current ascii charcter (eax was set to 4 for the print commands)
        inc eax                 ;increment eax to get the next ascii chacaracter while simultaneously functioning as the counter
        mov [res], eax          ;update the res variable with the incremented value of eax, which is the next ascii character
        cmp eax, 91             ;compare the incremented eax value to 91 (91 choosen to allow printing from A to Z)
        jl _start               ;if eax is less than 91, loop again, but if eax >= 91, continue to exit procedure
        call procExit

procOutput:                     ;output procedure
        mov edx, 1              ;output length
        mov ebx, 1              ;stdout
        mov eax, 4              ;system call (sys_write)
        int 0x80                ;interrupt kernel
        ret

procNewLine:                    ;newLine procedure
        mov edx, 1              ;output length
        mov ebx, 1              ;stdout
        mov eax, 4              ;dont need to reset ebx and edx, but after int 0x80, eax is set to 1, so we must reset to 4 for another print call
        mov ecx, newline        ;move new line charcter into ecx to be written to the terminal
        int 0x80                ;interrupt kernel
        ret

procExit:                       ;exit procedure
        mov eax,1
        int 0x80

segment .data
        res dd 65               ;Starting ascii character value
        newline dd 10           ;variable to hold the new line character