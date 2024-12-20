section .text
        global _start

_start:
        mov ecx, 3              ;array length 3 (0-2)
        mov ebx, 0              ;initializing  ebx 0
        mov eax, array          ;move array's address from the memory to the reg
                                ;the array address is equal to the address of 
                                ;the first element

top:
        add ebx, [eax]          ;add content of the array's first ele with the ebx
        add eax, 4              ;fetch next ele in array which is 4 bytes away
        loop top                ;loop to top label if ecx not zero 
        
        mov eax, 1       
        int 0x80

section .data
        array dd 5,10,15        ;size double data 4 bytes