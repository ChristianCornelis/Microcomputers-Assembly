*L7_1.x68 Christian Cornelis
        ORG       $8000
START   MOVE.W    #20,D0
        MOVE.W    #20,D1
        CLR.L     D2        ;clearing D2
        CMPI.W    #1,D1     ;if D1 is 1 initially
        BNE       LOOP
        ADD.W     D0,D2
        BRA EXIT
LOOP    LSR.W     #1,D1     ;dividing D1 by 2
        BCC       MULT      ;if C flag is clear, check loop condition
        ADD.W     D0,D2     ;adding to sum
MULT    LSL.W     #1,D0     ;multiply D0 by 2
        CMPI.W    #1,D1     ;if D1 is 1, then exit, otherwise loop again
        BNE       LOOP
        ADD.W     D0,D2
EXIT    TRAP      #14        ;exitting
        END       START
 

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
