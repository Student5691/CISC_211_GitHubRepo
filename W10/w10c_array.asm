section .text
        global _start

_start:
        xor eax, eax            ;clear eax, ebx, ecx registers
        xor ebx, ebx
        xor ecx, ecx

        mov ecx, 3              ;we start comparing with the 2nd array ele so only loop 3 times
        mov eax, array          ;move array's address from memory to reg
        mov ebx, [eax]          ;move the array's first element into ebx

top:
        add eax, 4              ;fetch next element in array 4 bytes away and move to eax
        cmp ebx, [eax]          ;check if the current ebx value is >= to the new eax value
        jge continue            ;if ebx is >= eax, continue without updating ebx
        mov ebx, [eax]          ;if ebx is < eax, update ebx with the new eax value
        
continue:
        loop top                ;decrment ecx and loop to "top" label while ecx is not zero 
        
        mov [largestNum], ebx   ;store the final largest number

        mov eax, 1              ;exit syscall
        xor ebx, ebx            ;exit code 0
        int 0x80

section .data
        array dd 5,11,12,15     ;each item is 4 bytes with 4 items in the array

section .bss
        largestNum resb 4       ;declare variable to hold the largest number