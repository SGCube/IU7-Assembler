.386
.model FLAT,C
PUBLIC DlinaStroki

.CODE
DlinaStroki proc
   push EBP
   mov EBP, ESP
   push EDI

   mov EDI, DWORD PTR [EBP+8]
   mov EBX, EDI

   cld
   xor AL, AL
   mov ECX, -1
   repne scasb

   mov EAX, EDI
   dec EAX
   sub EAX, EBX

   pop EDI
   mov ESP, EBP
   pop EBP
   ret
DlinaStroki endp
end
