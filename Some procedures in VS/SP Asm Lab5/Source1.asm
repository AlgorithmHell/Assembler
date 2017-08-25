.686
.model flat
.stack


public _TheShortestWordLength@8
public _SubString@16
public _Remove@8
public _StrTok@16

.data

buf dw 256 dup(?)

.code
_StrTok@16 proc
mov ebx, dword ptr [esp+4]
mov edx, dword ptr [esp+12]
mov cl, ' '
mov esi, dword ptr [esp+16]
mov edi, -1
Cycle:
inc esi
inc edi
cmp esi, dword ptr [esp+8]
JE Enddd

mov al, [ebx][esi*2]
mov [edx][edi*2],al
cmp [ebx][esi*2], cl
JE Enddd
jmp Cycle
Enddd:
mov al,0
inc edi
mov [edx][edi*2], al
;inc esi

mov eax, esi
ret 16
_StrTok@16 endp


_TheShortestWordLength@8 proc

		mov esi, -1;i
		mov ecx, 0; length of the word
        mov ebx, dword ptr [esp+4]
		mov edx, dword ptr [esp+12]; buf
		CycleOne:
		
			cmp esi, dword ptr [esp+8]
			JE Endd
				inc esi
			mov edi, esi
			dec edi
			 mov ecx, 0
			CycleTwo:

		inc edi
			cmp edi, dword ptr [esp+8]
			JE AfterCycleTwo
			inc ecx
			mov al, [ebx][edi]
			cmp al, ' '
			
			JE AfterCycleTwo
		jmp CycleTwo
			AfterCycleTwo:
		add esi, ecx
			cmp edx,ecx
			JNG CycleOne
			mov edx,ecx
			mov ecx,0
			jmp CycleOne
			Endd:
		
		mov eax, edx

ret 8
_TheShortestWordLength@8 endp

_SubString@16 proc

        mov ebx, dword ptr [esp+4]
		mov edx, dword ptr [esp+12]
		mov esi,-1
		mov eax,-10
		CycleOne:
		inc esi
			cmp esi, dword ptr [esp+8]
			JE Endd
			mov ecx,-1
			mov edi, esi
			dec edi
			CycleTwo:
		inc edi
			inc ecx
			cmp ecx, dword ptr [esp+16]
			JE Next
			push eax
			mov al, [ebx][edi]
			cmp al, [edx][ecx]
			pop eax
			JNE Next
			jmp CycleTwo


			Next:
		cmp ecx, dword ptr [esp+16]
			
			JNE CycleOne
			push eax
			mov al,[ebx][edi]
			cmp al, ' '
			pop eax
			JNE CycleOne
			mov eax, esi
			Endd:
		cmp eax,-10
			JNE TheEnd
			
		mov eax, -1
			TheEnd:       

ret 16
_SubString@16 endp

_Remove@8 proc
mov ebx, dword ptr [esp+4]
mov esi,-1
mov edx, dword ptr [esp+8]
CycleOne:
inc esi
cmp esi, edx
JE TheEnd
mov al, [ebx][esi*2]
cmp al, '\'
JNE CycleOne
push esi
mov edi, esi
dec edi
Cycle:
inc edi
cmp edi, edx
JE SkipThis
mov al, [ebx][edi*2]
cmp al, '\'
JE SkipThis
jmp Cycle
SkipThis:
push esi
mov ecx, edi

push edx
inc edx
dec esi
CycleTwo:
inc ecx
inc esi
cmp ecx, edx
JE Afterr
mov al, [ebx][ecx*2]
mov [ebx][esi*2+2],al


jmp CycleTwo

Afterr:
pop edx
mov al, 0
mov [ebx][esi*2+2],al
pop esi
dec esi
pop ecx
mov al,' '
mov [ebx][ecx*2],al
jmp CycleOne
TheEnd:



mov al, ' '
mov [ebx+2],al
mov eax, ebx
ret 8
_remove@8 endp

end