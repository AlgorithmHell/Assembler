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
    
    
     n dq 1000.0000000
	 k dq 0.0000000
	 prevXk dq -1.0000000
	 left_range dq 0.0000000;
	 right_range dq 6.2831853
	 
	 buf dq 0.0000000
	 
	 result dq 0.0000000
	 one  dq 1.0000000
	 two dq 2.0000000
	 buff               	db  300 dup(0)
.data?
   step dq ?
   result_accum  dq ?
          
    
.code

MainProc	proc
           
 finit
 fld right_range
 fld left_range
 
 fsub
 fdiv n
 fstp step
  
  _beg_ :
		fld k
			fadd one
			fstp k
			fld prevXk
			fadd one
			fstp prevXk
			fld step
			fmul k
			fadd left_range
			fst result; current Xk

			fcos
		    ;fabs
			fmul result
			fstp buf; height
			fld step
			fmul prevXk
			fld result
			fsub
			 fabs
			fmul buf
			fadd result_accum
			
			fstp result_accum


				
			    fld k
			    fld n

			fcompp
			fstsw ax
			sahf
			jne _beg_
				
    invoke  FloatToStr, result_accum, addr buff
    invoke  StdOut, addr buff    
    invoke  StdOut, addr endl
   
		
    invoke  StdIn, addr buff, 300
    invoke  ExitProcess, 0
                    
MainProc endp
end MainProc