section .data
        filename db 'encyptDecryptOutput.txt', 0h       ; define a file name
        msg db 'M', 'o', 'o', 's', 'e'                  ; message to be encrypted
        key db 'g', 'H', 'J', 'Q', 'V'                  ; key selected to ensure no non-printable ascii characters
        line1 db 'Plain text: ', 0h                     ; text label 1
        line1_len equ $ - line1                         ; length of text label 1
        line2 db 'Key: ', 0h                            ; text label 2
        line2_len equ $ - line2                         ; length of text label 2
        line3 db 'Encrypted text: ', 0h                 ; text label 3
        line3_len equ $ - line3                         ; length of text label 3
        line4 db 'Decrypted text: ', 0h                 ; text label 4
        line4_len equ $ - line4                         ; length of text label 4
        newline db 0xA                                  ; new line character

section .bss
        fd_out resb 4                                   ; variable to hold the file descriptor
        encryptedMsg resb 5                             ; varaible to hold the encrypted message
        decryptedMsg resb 5                             ; variable to hold the decrypted message

section .text
        global _start

_start:
        xor eax, eax                                    ; clear registers
        xor ebx, ebx
        xor ecx, ecx
        xor edx, edx

        mov ecx, 0                                      ; counter and iterator for the loop to get each char in msg and key
        mov edx, 5                                      ; length of the msg and key char arrays

encrypt:
        mov eax, [msg + ecx]                            ; move the msg value at the index of the current loop iteration into eax
        xor eax, [key + ecx]                            ; xor eax with the key value at the index of the current loop iteration
        mov [encryptedMsg + ecx], eax                   ; store the result in the corresponding index of the encryptedMsg variable
        inc ecx                                         ; increment ecx (counter/iterator) by 1
        cmp ecx, edx                                    ; compare ecx to edx
        jl encrypt                                      ; if ecx is less than edx, loop, otherwise continue

        mov ecx, 0                                      ;reset counter/index to 0 for the decryption
decrypt:
        mov eax, [encryptedMsg + ecx]                   ; move the encryptedMsg value at the index of the current loop iteration into eax
        xor eax, [key + ecx]                            ; xor eax with the key value at the index of the current loop iteration
        mov [decryptedMsg + ecx], eax                   ; store the result in the corresponding index of the decryptedMsg variable
        inc ecx                                         ; increment ecx (counter/iterator) by 1
        cmp ecx, edx                                    ; compare ecx to edx
        jl decrypt                                      ; if ecx is less than edx, loop, otherwise continue

        ; create the file
        mov ecx, 0711o                                  ; set all permissions to read, write, execute (octal format)
        mov ebx, filename                               ; name of the file to be created
        mov eax, 8                                      ; SYS_CREAT (kernel opcode 8)
        int 0x80                                        ; call kernel

        ; open the file for writing
        mov eax, 5
        mov ebx, filename
        mov ecx, 1
        mov edx, 0777o                                  ; open with all permissions
        int 0x80
        mov [fd_out], eax                               ; store file descriptor in the fd_out variable

        ; write the first line to the file
        mov eax, 4                                      ; write the first text label
        mov ebx, [fd_out]
        mov ecx, line1
        mov edx, line1_len
        int 0x80

        mov eax, 4                                      ; write the plain-text message
        mov ecx, msg
        mov edx, 5
        int 0x80

        mov eax, 4                                      ;write a new line
        mov ecx, newline
        mov edx, 1
        int 0x80

        ; write the second line to the file
        mov eax, 4                                      ; write the second text label
        mov ecx, line2
        mov edx, line2_len
        int 0x80

        mov eax, 4                                      ; write the key
        mov ecx, key
        mov edx, 5
        int 0x80

        mov eax, 4                                      ; write a new line
        mov ecx, newline
        mov edx, 1
        int 0x80

        ; write the third line to the file
        mov eax, 4                                      ; write the third text label
        mov ecx, line3
        mov edx, line3_len
        int 0x80

        mov eax, 4                                      ; write the encrypted message
        xor ecx, ecx
        mov ecx, encryptedMsg
        mov edx, 5
        int 0x80

        mov eax, 4                                      ; write a new line
        mov ecx, newline
        mov edx, 1
        int 0x80

        ; write the fourth line to the file
        mov eax, 4                                      ; write the fourth text label
        mov ecx, line4
        mov edx, line4_len
        int 0x80

        mov eax, 4                                      ; write the decrypted message
        mov ecx, decryptedMsg
        mov edx, 5
        int 0x80

        mov eax, 4                                      ; write a new line
        mov ecx, newline
        mov edx, 1
        int 0x80

                                                        ; close file
        mov eax, 6
        int 0x80

        mov eax,1                                       ; exit sequence
        xor ebx, ebx
        int 0x80