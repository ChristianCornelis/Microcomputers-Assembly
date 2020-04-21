        ORG      $8000
START   CLR      D0
        CLR      D1
        LEA      $a0a0a0a0,A0
        LEA      $a1a1a1a1,A1
        LEA      $9020,sp
        MOVE.W   x,-(sp)
        MOVE.W   y,-(sp)
        PEA      z
        JSR      square
        LEA      8(sp), sp
        TRAP     #14
        
square  LINK     A0,#-6
        MOVEM    D0-D1/A1, -(sp)
        MOVE.W   14(A0),D0      ;moving x to D0
        MULS     D0,D0          ;square x
        MOVE.W   D0,-2(A0)      ;store in u
        MOVE.W   12(A0),D0      ;move y to D0
        MULS     D0,D0          ;square y
        MOVE.W   D0,-4(A0)      ;store in v
        MOVE.W   14(A0),D0      ;get x in d0
        MULS     #2,D0          ;multiply d0 by 2
        MOVE.W   12(A0),D1      ;move y to d1
        MULS     D1,D0          ;multiply d0 and d1
        MOVE.W   D0,-6(A0)      ;store in w
        MOVE.W   -2(A0),D0      ;move u into d0
        MOVE.W   -4(A0),D1      ;move v into d1
        ADD.W    D0,D1          ;adding u and v
        MOVE.W   -6(A0),D0      ;moving w to d0
        ADD.W    D1,D0          ;adding u+v+w
        LEA      8(A0),A1       ;moving z to A1
        MOVE.W   D0,(A1)        ;adding d0 to z
        MOVEM.L  (sp)+,D0-D1/A1 ;returning register data
        UNLK     A0             ;unlinking
        RTS                     ;return
         




        ORG    $9500
x       DC.W   2
y       DC.W   3
z       DC.W   4
        END    START 

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
