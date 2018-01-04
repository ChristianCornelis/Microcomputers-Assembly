           ORG      $8000
START      LEA      $9030,sp
           PEA      x
           PEA      y
           PEA      z
           PEA      w
           JSR      solveQuad  ;call farquad
           LEA      16(sp),sp  ;clean stack
           LEA      w,a0       ;load w to a0
           MOVE.W   (a0),d0    ;move ans to d0
           TRAP     #9

solveQuad  MOVEM.L  d0-d2/a0,-(sp) ;saving all registers on stack
           MOVEA.L  32(sp),a0      ;moving x into a0
           MOVE.W   (a0),d0        ;moving x to d0
           MULS     d0,d0          ;x*x
           MULS     #5,d0          ;5*x^2
           MOVE.W   (a0),d1        ;move x into d1 
           MULS     #4,D1          ;4*x
           MOVEA.L  28(sp),a0      ;move y into a0
           MOVE.W   (a0),D2        ;move y to d1
           MULS     D2,D1          ;4*x*y
           SUB.L    d1,d0          ;5*x*y-4*x*y
           MOVEA.L  24(sp),a0      ;z to a0
           MOVE.W   (a0),D1        ;z to d1
           MULS     D1,D1          ;z*z
           ADD.L    d1,d0          ;5*x*y-4*x*y
           MOVEA.L  20(sp),a0      ;move w to a0
           MOVE.W   D0,(a0)        ;move ans to w
           MOVEM.L  (sp)+,d0-d2/a0 ;restore contents of registers
           RTS                     ;return

           
           ORG      $9500
x          DC.W     3
y          DC.W     4
z          DC.W     5
w          DS.W     1
           END      START           
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
