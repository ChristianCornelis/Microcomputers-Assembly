*template


	ORG	$8000

PROGRAM MOVE.W #5,D0
    MULS    #9,D0
    MOVE.W  #5,D2
    DIVS.W  D2,D0
    ADD.B   #32,D0
    MOVE.W  D0,D1
	TRAP	#14
	END	$8000

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
