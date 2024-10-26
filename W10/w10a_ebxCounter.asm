; EXPLANATION:
; ------------------------------------------------------------------------------
; Observing in gdb, we see that ebx gets set to 10 initially as expected.
; However, "loop" defaults to using the ecx register, not ebx, therefore
; ebx is not decremented, but ecx is. "Loop" also does a built-in pseduo
; "compare-to-zero" against ecx, not ebx, so the first comparison will be
; against whatever ecx starts as, minus 1. In my case, ecx was initially 0,
; therefore the comparison that loop performs is:
; "what is ecx? It is -1, not zero, so I should decrement ecx and loop"
; Then ecx becomes -2 and compares again. It would have to go through 2^32
; iterations before the unsigned int gets back to 0. In the Jupyter environment,
; this takes about 6 seconds, depending on the virtual machine's allocated
; resources.

section .text
        global _start

_start:
        mov ebx, 10             ;initializing  ebx to 10

top:
        loop top                ;decrement ecx and loop to "top" label
        
        mov eax, 1              ;exit sequence
        int 0x80