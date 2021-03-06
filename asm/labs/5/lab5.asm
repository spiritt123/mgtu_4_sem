format ELF64

extrn PRINTP_$$_PRINTP$SHORTSTRING

section '.bss' writable

vowel    db "qeyuioaj"
inbuf    DB    100 DUP (?)
temp     DB 255 DUP (?)

section '_Z11deleteVowelPc' executable
         push rbx
         mov rbx, rsp

         push rax
         push rbx
         push rcx
         push rdi
         push rsi

         lea rdi, [rbx + 8]
         lea rsi, [rbx + 8]
         xor rax, rax
         xor rbx, rbx
next:
         mov al, [rdi]
         mov rcx, 8
         lea ebx, [vowel]
search_vowel:
         cmp al, [rbx]
         je delete_vowel
         inc rbx
         loop search_vowel
         mov [rsi], al
         jmp continue
delete_vowel:
         dec rsi
continue:
         inc rdi
         inc rsi
         mov al, [rsi]
         cmp al, 0ah
         jne next

         mov rax, [rbx + 8]
         pop rsi
         pop rdi
         pop rcx
         pop rbx
         push rax
         call PRINTP_$$_PRINTP$SHORTSTRING 
        
        pop rbp
        ret 16
