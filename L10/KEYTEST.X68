DUART   EQU     $C001
SRA     EQU     2
RBA     EQU     6
OPR_SET  EQU      14*2        ;set bit command reg.
OPR_CLR  EQU      15*2        ;clear bit cmd. reg.

        ORG     $8000
KEYTEST MOVEA.L #TEXT,A1
        BSR     SCAN
        TRAP    #14       
 
SCAN    MOVE.L  D0,-(A7)
OUTSTR  MOVE.L  A0,-(A7)
        MOVE.W  D7,-(A7)
        MOVEA.L #DUART,A0
OUTCHR  MOVE.B  SRA(A0),D7
        ANDI.B  #1,D7
        BEQ     OUTCHR
        MOVE.B  RBA(A0),D0
        ANDI.B   #$FF,D0     ;(mask if desired)
        MOVE.B  D0,D1
        JSR     OUT681
        MOVE.W  (A7)+,D7
        MOVE.L  (A7)+,A0
        CMPI    #$71,D0     ;quit if q inputted
        BEQ     EXIT
        MOVE.B  D0,(A1)+
        BRA     OUTSTR
EXIT    MOVE.L  (A7)+,D0
        MOVE.B  #0,(A1)+    ;null terminating
        RTS

OUT681   MOVE.B   #$FF,OPR_CLR(A0) ;clr. bits, set pins
         MOVE.B   D1,OPR_CLR(A0) ;clr. bits, set pins
         MOVE.B   D1,OPR_SET(A0) ;set bits, clr. pins
         CLR.L    D1
         RTS
        
TEXT    DS.L    1
        END     KEYTEST



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
