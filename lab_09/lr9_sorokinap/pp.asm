.386
.model FLAT,C
public p1, p2
.code
p1:
	push ebp
	mov ebp,esp
	mov ecx,[ebp+8]
	mov ebx,[ebp+12]

	cmp ecx, 1
	jz m1

	dec ecx

	push ebx
	push ecx
	call p1
	pop ecx
	pop ebx

	inc ecx
	mov eax, [ebx]
	mul ecx
	jmp finish
m1:
	mov eax, 1
finish:
	mov [ebx],eax
	pop ebp
	ret

rec:
	cmp ecx, 1
	jbe rec1

	dec ecx
	call rec
	inc ecx

	mov eax, [ebx]
	mul ecx
	jmp rfin
rec1:
	mov eax, 1
rfin:
	mov [ebx],eax
	ret

p2:
	push ebp
	mov ebp,esp
	mov ecx,[ebp+8]
	mov ebx,[ebp+12]
	call rec
	pop ebp
	ret
END