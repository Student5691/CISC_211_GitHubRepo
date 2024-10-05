section .text
        global _start

_start:
                                ;Observe these steps in gdb to confirm.
                                ;Use test to check even/odd status of eax reg.
        mov eax, 11             ;We will check the value 11, which is odd.
        test eax, 1             ;Compare the last bit of eax with 1, if that bit
                                ;is 0, the zero flag (ZF) will be set to 1. If
                                ;the last bit of eax is 0, it is an even number.
                                ;If the last bit of eax is 1, ZF is set to 0,
                                ;indicating that it is false that the last eax bit
                                ;is 0, which means eax hold an odd number.
                                ;Via StackOverflow, I see we can use flags with
                                ;conditional logic. Based on that and lecture notes
                                ;I implemented this in W7extra_jump_Leavitt.asm

        mov eax, 1
        int 0x80