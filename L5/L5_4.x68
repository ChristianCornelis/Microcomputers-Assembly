*Lab5_4.x68: Christian Cornelis
	 
	     ORG	     $8000
START    MOVE.W      num1,D0
         MOVE.W      num2,D1
         CMP.W       D1,D0        ;comparing num1 and num2
         BLT         else2        ;if false, going to else 2
         MOVE.W      num3,D1
         CMP.W       D1,D0        
         BLT         else1        ;if false, going to else1
         MOVE.W      num1,biggest ;moving num1 to biggest and then biggest to D0 and exitting
         MOVE.W      biggest,D2   
         BRA         exit         
else1    MOVE.W      num3,biggest ;moving num3 to biggest and then biggest to D0 and exitting
         MOVE.W      biggest,D2   
         BRA         exit
else2    MOVE.W      num2,D0
         MOVE.W      num3,D1
         CMP.W       D1,D0        ;comparing num2 and num3
         BLT         else3        ;if false, going to else 3
         MOVE.W      num2,biggest ;moving num2 to biggest and then biggest to D0 and exitting
         MOVE.W      biggest,D2
         BRA         exit
else3    MOVE.W      num3,biggest
         MOVE.W      biggest,D2
         BRA         exit
exit     TRAP        #14          ;exitting

         ORG         $9000
num1     DC.W        2
num2     DC.W        8
num3     DC.W        -5
biggest  DS.W        1
         END         START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
