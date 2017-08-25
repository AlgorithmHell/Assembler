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
    szPrompt            db "Input a, b, c: ", 0
    szGoodBye     	    db  "Ln 2: Real and Mine", 13, 10, 0

    endl                db 0dh, 0ah, 0                 
    
    
    
    x                   dq 10.5000000
    buf                 dq 1.0000000
	temp                dq 0.00000000
	result              dq 0.00000000000
	k                   dq 0.0000000
	one                 dq 1.0000000
    n                   dq 25000.0000000	
	a                   dq 0.5000000
	MinusOne            dq -1.0000000     
	buff               db  300 dup(0)
.data?
  
    ln_a                dq ?      
    
.code

MainProc	proc
           
 finit
		fldln2
		fmul MinusOne
		fstp ln_a
		fld result
		fadd one
		fstp result
		_start_ :
		fld k
			fadd one
			fstp k

			fld buf
			fmul ln_a
			fmul x
			fdiv k
			fstp buf
			fld result
			fadd buf
			fstp result

			fld n
			fld k

			fcompp
			fstsw ax
			sahf
			jne _start_
				
    invoke  FloatToStr, result, addr buff
    invoke  StdOut, addr buff    
    invoke  StdOut, addr endl
   
		
    invoke  StdIn, addr buff, 300
    invoke  ExitProcess, 0
                    
MainProc endp
end MainProc