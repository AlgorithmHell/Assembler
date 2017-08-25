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
    
    
    result_temp         dq 0.0000000
    result_accum        dq 0.0000000
   
    four                dq 4.0000000
    one                 dq 1.0000000
    two                 dq 2.0000000
    buf                 dq 0.0000000
    precision           dq 1.0000000
    max                 dd 10000
    k                   dq 0.0000000
    RealLn              dq 0.0000000
	 buff               	db  300 dup(0)
.data?
   
    _result              dq ?
          
    
.code

MainProc	proc
           
 
  mov ecx, max
			_begin_:
			dec ecx
				jecxz _end_
			finit
				fld k
				fadd one
				
				fstp k
				

				fld k
				fld k
				fmul st(0), st(1)
				fld four
				fmul st(0), st(1)
				fsub one
				fld k
				fmul st(0), st(1)
				fst buf
				fld one
				fdiv buf

				fadd result_temp
				fst result_temp
				jmp _begin_

				_end_ :

			fld result_accum
				fadd result_temp
				fst result_accum

				fadd one
				fdiv two
				fstp _result
				
    invoke  FloatToStr, _result, addr buff
    invoke  StdOut, addr buff    
    invoke  StdOut, addr endl
    finit 
		fldln2
		fstp RealLn
		invoke  FloatToStr, RealLn, addr buff
		invoke  StdOut, addr buff 
    invoke  StdIn, addr buff, 300
    invoke  ExitProcess, 0
                    
MainProc endp
end MainProc