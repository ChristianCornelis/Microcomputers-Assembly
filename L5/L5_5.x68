*Lab5_5.x68: Christian Cornelis
	 
	     ORG	     $8000
START    MOVE.W      num1,D0
         MOVE.W      num2,D1
         CMP.W       D1,D0         ;comparing num1 and num2
         BLT         elseIf        ;if false, going to elseIf
         MOVE.W      num3,D1       ;if true, comparing num2 and num3
         CMP.W       D1,D0        
         BLT         elseIf        ;if false, going to elseIf
         MOVE.W      num1,biggest  ;if true, moving num1 to biggest and then biggest to D0 and exitting
         MOVE.W      biggest,D2    
         BRA         exit         
elseIf   MOVE.W      num1,D0       ;comparing num1 and num2
         MOVE.W      num2,D1
         CMP.W       D0,D1
         BLT         else          ;going to else if false
         MOVE.W      num2,D0       ;if true, comparing num2 and num3
         MOVE.W      num3,D1
         CMP.W       D1,D0
         BLT         else          ;if false, go to else
         MOVE.W      num2,biggest  ;if true, move num2 to biggest and biggest to D0 and exitting
         MOVE.W      biggest,D0   
         BRA         exit
else     MOVE.W      num3,biggest  ;moving num3 to biggest and then biggest to D0 and exitting
         MOVE.W      biggest,D2
         BRA         exit
exit     TRAP        #14           ;exitting

         ORG         $9000
num1     DC.W        -$A
num2     DC.W        -5
num3     DC.W        -2
biggest  DS.W        1
         END         START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
