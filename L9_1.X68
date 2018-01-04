        ORG   $802A
        JMP   T6
        JMP   T7
        
        ORG   $9000
T6      ORI   #%0010000000000000,(SP)
        RTE
        
        ORG   $902A
T7      ANDI  #%1101111111111111,(SP)
        RTE
        
        ORG   $A000
START   TRAP  #6
        TRAP  #7
        TRAP  #14
        END   START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
