*Lab5_3.x68: Christian Cornelis
	 
	     ORG	     $8000
START    MOVE.B      hexVal,D0
         ADD.B       #$30,D0
         CMPI.B      #$39,D0      ;comparing hexVal and 39
         BLE         exit         ;if false, exit
         MOVE.B      D0,hexVal    ;storing d0 back into hexVal
         ADD.B       #$7,D0       ;else add 7 to charCode
         MOVE.B      d0,charCode
         MOVE.B      charCode,D1
         BRA         exit 
exit     TRAP        #14          ;exitting

         ORG         $9000
hexVal   DC.B        $5
charCode DC.B        $0
         END         START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
