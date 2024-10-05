section .text
        global _start

_start:
                                ;Observe these steps in gdb to confirm.
                                ;Use test to check even/odd status of eax reg.
        mov eax, 11             ;We will check the value 11, which is odd.
        test eax, 0             ;Compare the last bit of eax with 0, if that bit
                                ;is also 0, the zero flag (ZF) will be set. If
                                ;the last bit of eax is zero, it is an even number.
                                ;Via StackOverflow, I see we can use flags with
                                ;conditional logic, once we cover that material
                                ;we could interrogate the flag status and use a
                                ;jump to print out whether or not the number is
                                ;even or odd.

        mov eax, 1
        int 0x80