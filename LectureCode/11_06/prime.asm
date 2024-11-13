section .text
        global _start

_numberchecker:
        push ebp
        mov ebp, esp
        sub esp, 4

        mov eax, DWORD[ebp+8]
        test eax
        jz exit                         ;if the number is even, exit because all even numbers are not prime, except 2

        mov ecx, eax

divide:                                 ;go to the divide label if the number is odd, text if it is prime by dividing by odd numbers
        xor edx, edx                    ;clear the edx register which will hold a remainder
        sub ecx, 2                      ;sub 2 from ecx, since an odd number is not divisible by an even number, no need to divide by an even number, so sub 2 to go to the next odd
        cmp ecx, 1                      ;if ecx gets all the way down to one, the starting number is prime
        je prime
        div eax, ecx                    ;divide the starting number with the appropriate odd number
        cmp edx, 0                      ;if there is no remainder in edx, it is not prime
        je exit                         ;if edx is zero, jump to exit
        loop divide

exit:
        leave
        ret

_start:
        mov ecx, 20
        push ecx
        call _numberchecker
        pop ecx
        loop _start

        mov eax, 1
        int 0x80