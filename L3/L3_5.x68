
	
	ORG	$8000

START   MOVE.W	VAR1,D0	;moving W value
	MOVE.B	VAR1+4,D1	 ;moving Y value
	EXT.W   D1       ;extending y to a word
    MULS.W	D0,D1	 ;multiplying w and y values
    MOVE.W  VAR1+2,D2  ;moving x value to d2
    DIVS.W  #3,D2    ;dividing
    ADD.W   D2,D1    ;adding product and quotient
    MOVE.W  D1,VAR1+6  ;moving answer to var4
	TRAP	#14		

	ORG	$9000
VAR1	DC.W	5	 ;W
	    DC.W	9    ;X
    	DC.B	3    ;Y
        DS.B    1    ;SPACE to align memory correctly
        DS.L    1    ;Z
		
	END	START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
