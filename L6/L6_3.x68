*Lab6_3.x68: Christian Cornelis
	 
	     ORG	     $8000
START    LEA         MATRIX,A0
         CLR.L       D0
         CLR.L       D1
         CLR.L       D2
         CLR.L       D3
         CLR.L       D4
FOR1     CMPI.B      #2,D0                ;seeing if D0 is 2
         BGT         EXIT                 ;branch to exit
         MOVE.B      D0,D1
         ADD.B       #1,D1                ;moving i to D1 and then adding 1
FOR2     CMPI.B      #3,D1                ;seeing if j is 3
         BGT         ITERATEI             ;branching to i iteration
         MOVE.B      D0,D3
         MULS        #4,D3                ;row x number of columns
         ADD.B       D1,D3
         MOVE.B      (A0,D3.L),D2         ;moving number to D2
         MOVE.B      D1,D4                ;move D1 to D4
         MULS        #4,D4
         ADD.B       D0,D4
         MOVE.B      (A0,D4.L),(A0,D3.L)
         MOVE.B      D2,(A0,D4.L)
         ADD.B       #1,D1
         BRA         FOR2
ITERATEI ADD.B       #1,D0
         BRA         FOR1
EXIT     TRAP        #14
      
         ORG         $9000
MATRIX   DC.B        1,2,3,4
         DC.B        5,6,7,8
         DC.B        9,10,11,12
         DC.B        13,14,15,16
         END         START





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
