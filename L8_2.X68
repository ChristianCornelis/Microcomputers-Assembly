           ORG      $8000
START      MOVE.W   #3,d2     ;x
           MOVE.W   #4,d3     ;y
           MOVE.W   #5,d4     ;z
           LEA      $9020,sp
           MOVE.W   d2,-(sp)  ;moving x, y, z onto stack
           MOVE.W   d3,-(sp)
           MOVE.W   d4,-(sp)
           JSR      solveQuad ;call farquad
           LEA      6(sp),sp  ;clean stack
           TRAP     #9

solveQuad  MOVEM.L  d2-d4,-(sp);saving all registers on stack
           MOVE.W   20(sp),D2  ;moving x into d0
           MULS.W   D2,D2      ;x*x
           MULS     #5,D2      ;5*x^2
           MOVE.W   20(sp),D3  ;move x into d1 
           MULS     #2,D3      ;2*x
           MOVE.W   18(sp),D4  ;move y into d2
           MULS     D4,D3      ;2*x*y
           MOVE.W   16(sp),D4  ;z to D2
           MULS     D4,D4      ;z*z
           SUB.W    D3,D2      ;5*x^2 - 2*x*y
           ADD.W    D4,D2      ;5*x^2 - 2*x*y + z*z
           MOVE.W   D2,D1      ;move ans into d1
           MOVEM.L  (sp)+,d2-d4 ;restore contents of registers
           RTS                 ;return
           
           END      START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
