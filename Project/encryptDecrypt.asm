section .text
        global _start:

section .data
        msg dd 'M', 'o', 'o', 's', 'e', 0
        key dd 'g', 'H', 'J', 'Q', 'V', 0       ; key selected to ensure no non-printable ascii characters
        line1 db 'Plain text: ', 0
        line 2 db ''
        newline db 0xA

