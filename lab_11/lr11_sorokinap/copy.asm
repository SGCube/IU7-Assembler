.386
.model FLAT,C
PUBLIC CopyStr

.CODE
CopyStr proc
	push EBP
	mov EBP, ESP
	push ESI
	push EDI

	mov ECX, [EBP+16]				;L
	mov EDI, DWORD PTR [EBP+12]		;S2
	mov ESI, DWORD PTR [EBP+8]		;S1
	mov EBX, EDI
	mov EDX, ECX

	cmp ESI, EDI
	je finish
	
s1to0:
	xor AL, AL
	inc ECX
	repne scasb
	sub EDX, ECX
	mov ECX, EDX

s2to0:
	mov EDI, EBX
	mov EBX, ESI
	xchg EDI, ESI

	inc ECX
	repne scasb
	sub EDX, ECX
	mov ECX, EDX

ptrret:
	xchg EDI, ESI
	mov ESI, EBX
	mov EBX, EDI
	
ptrcmp:
	cld
	cmp ESI, EDI
	ja movelp

	mov EAX, EDI
	sub EAX, ESI
	cmp EAX, ECX
	ja movelp

	mov EDX, ECX
	dec EDX
	add EDI, EDX
	add ESI, EDX
	std
	
movelp:
	rep movsb

finish:
	mov EAX, EBX
	
	pop EDI
	pop ESI
	mov ESP, EBP
	pop EBP
	ret
CopyStr endp
end
