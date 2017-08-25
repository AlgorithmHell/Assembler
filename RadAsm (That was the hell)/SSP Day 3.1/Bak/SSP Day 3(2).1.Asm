.486
.model flat, stdcall                    
option casemap :none

include windows.inc     ; always first

include masm32.inc
include gdi32.inc
include user32.inc
include kernel32.inc

includelib masm32.lib
includelib gdi32.lib
includelib user32.lib
includelib kernel32.lib

.data
    szPrompt            db "Root : ", 0
    szGoodBye     	    db  "Ln 2: Real and Mine", 13, 10, 0

    endl                db 0dh, 0ah, 0                 
    a                   dq  2.0000000		
    b                   dq  3.0000000
	_c                  dq  4.0000000
	ZeroNum             dq  0.0000000
	MakeAbs             dq -1.0000000
	two                 dq  2.0000000
    
     
	 buff               	db  300 dup(0)
.data?
  
    buf                 dq ?
	BeginA              dq ?
	BeginB              dq ?
	Resulting           dq ?
	PossibleRoot        dq ?    
    
.code

MainProc	proc
           
 
				finit
		fld a	
		fst BeginA
		fmul MakeAbs		
		fcomp b
		fstsw ax
		sahf
		jb JustContinue
		je SetRoot
		fld a
		fld b
		fst BeginB
		fstp a
		fstp b
		JustContinue :
		fld b
			fstp BeginB
		    fld a				
			fmul MakeAbs
			
			fstp a
		xor ecx, ecx
			mov ecx, 500
			Cycle :
			dec ecx
			cmp ecx, 0
			je GoAndSetRoot
			fstp buf
			fld a
			
			fld b
			fadd
			fld two
			fdiv
			fstp PossibleRoot
			fstp buf

			; 
			fld PossibleRoot
				fld PossibleRoot
				fmul
				fld PossibleRoot
				fmul

				fstp Resulting
				fld PossibleRoot
				fld BeginA
				
			fmul
			fld PossibleRoot
			fmul
			fadd Resulting
			fstp Resulting

			fld BeginB
			fld PossibleRoot
			fmul
			fadd Resulting

			fadd c

			fcom ZeroNum
			fstsw ax
			sahf
			je GoAndSetRoot
			ja goHere
			fld PossibleRoot
			fstp a
			fstp buf

			jmp Cycle
			goHere :
		    fld PossibleRoot
			fstp b
			fstp buf
			fstp buf

			jmp Cycle
			GoAndSetRoot :
		    fstp buf
			fstp buf

			jmp Endd
			SetRoot :
		    fld b
			fstp PossibleRoot
			jmp Endd

			Endd :
				
    
    invoke  StdOut, addr szPrompt
    invoke  FloatToStr, PossibleRoot, addr buff
    invoke  StdOut, addr buff    
    
   
		
    invoke  StdIn, addr buff, 300
    invoke  ExitProcess, 0
                    
MainProc endp
end MainProc