          ORG     $8000
main      LEA     $9000,SP
          MOVE.W  #1234,-(SP)
          BSR     display
          LEA     2(SP),SP
          TRAP    #14
display   LINK    A6,#-4
          MOVEM.L D0,-(SP)
          CLR.L   D0
          MOVE.W  8(A6),D0
          DIVS    #10,D0
          MOVE.W  D0,-4(A6)  ;moving quotient
          SWAP    D0         ;swapping D0
          MOVE.W  D0,-2(A6)  ;moving remainder
          CMPI.W  #0,-4(A6)
          BEQ     else
          MOVE.W  -4(A6),-(SP)
          BSR     display
          LEA     2(SP),SP       
else      CLR.L   D1
          MOVE.W  -2(A6),D0
          ADD.B   #$30,D0    ;converting to ASCII
          TRAP    #1        ;printing what's in D1
          MOVEM.L (SP)+,D0          
          UNLK    A6
          RTS     
          END     main


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
