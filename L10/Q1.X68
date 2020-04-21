DUART   EQU     $C001
SRA     EQU     2
TBA     EQU     6
CR      EQU     $0D
LF      EQU     $0A

        ORG     $8000
MESSAGE MOVEA.L #TEXT,A1
        BSR     PRINT
        TRAP    #14       
 
PRINT   MOVE.L  D0,-(A7)
OUTSTR  MOVE.B  (A1)+,D0
        BEQ     EXIT
        MOVE.L  A0,-(A7)
        MOVE.W  D7,-(A7)
        MOVEA.L #DUART,A0
OUTCHR  MOVE.B  SRA(A0),D7
        ANDI.B  #4,D7
        BEQ     OUTCHR
        MOVE.B  D0,TBA(A0)
        MOVE.W  (A7)+,D7
        MOVE.L  (A7)+,A0
        BRA     OUTSTR
EXIT    MOVE.L  (A7)+,D0
        RTS
        
TEXT    DC.B    CR,LF,'Ay lmao',0
        END     MESSAGE 
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
