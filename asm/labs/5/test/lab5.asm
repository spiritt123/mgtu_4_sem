;extrn PRINTP_$$_PRINTP$SHORTSTRING
global deleteVowel
section '.bss' ;writable

vowel    db "qeyuioaj"

;section '_Z11deleteVowelPc' ;executable
deleteVowel:
         push ebx
         mov ebx, esp

         push eax
         push ebx
         push ecx
         push edi
         push esi

         lea edi, [ebx + 8]
         lea esi, [ebx + 8]
         xor eax, eax
         xor ebx, ebx
next:
         mov al, [edi]
         mov ecx, 8
         lea ebx, [vowel]
search_vowel:
         cmp al, [ebx]
         je delete_vowel
         inc ebx
         loop search_vowel
         mov [esi], al
         jmp continue
delete_vowel:
         dec esi
continue:
         inc edi
         inc esi
         mov al, [esi]
         cmp al, 0ah
         jne next

         mov eax, [ebx + 8]
         pop esi
         pop edi
         pop ecx
         pop ebx
         push eax
         ;call PRINTP_$$_PRINTP$SHORTSTRING 
        
        pop ebp
        ret 
