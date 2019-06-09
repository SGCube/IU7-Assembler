.386
.model FLAT,C
PUBLIC DelProbel

.CODE
DelProbel proc
   push EBP
   mov EBP, ESP
   push EDI
   push ESI

   mov EDI, DWORD PTR [EBP+8]
   mov EBX, EDI

leadsp:
   cld
   mov AL, ' '
   mov ECX, -1
   repe scasb
   dec EDI
   mov ESI, EDI

toend:
   cld
   xor AL, AL
   repne scasb
   sub EDI, 2

endsp:
   std
   mov AL, ' '
   mov ECX, -1
   repe scasb
   inc EDI

ptrset:
   mov ECX, EDI
   sub ECX, ESI
   mov EDI, EBX
   mov EDX, ECX

shift:
   cld
   rep movsb
   xor AL, AL
   stosb

finish:
   mov EAX, EDX

   pop ESI
   pop EDI

   mov ESP, EBP
   pop EBP
   ret
DelProbel endp
end
