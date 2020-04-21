*Lab6_3.x68: Christian Cornelis
	 
	     ORG	     $8000
START    LEA         STRING1,A0
         LEA         STRING2,A1
         MOVE.B      #$FF,D0
CODE     MOVE.B      (A0)+,D1 
         MOVE.B      (A1)+,D2   
         CMP.B       D2,D1       ;if character != *pointer2++
         BEQ         WHILE
         MOVE.B      #$00,D0     ;moving 00 to D0
WHILE    CMPI.B      #$D,D1
         BEQ         EXIT
         CMPI        #$FF,D0
         BEQ         CODE
EXIT     TRAP        #14
      
         ORG         $9000
STRING1  DC.B        'Hello',$D

         ORG         $9020
STRING2  DC.B        'Hello',$D        
         END         START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
