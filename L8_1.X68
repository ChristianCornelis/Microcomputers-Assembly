           ORG      $8000
START      MOVE.W   #-5, d0
           LEA      $9010,sp
           MOVE.W   d0, -(sp)
           JSR      solveQuad                  
           LEA      2(sp),sp
           TRAP     #9

solveQuad  MOVE.W   4(sp),D1   ;moving x into d1
           MULS.W   D1,D1      ;x*x
           MULS     #5,D1      ;5*x^2
           MOVE.W   4(sp),D2   ;move x into d2 
           MULS     #2,D2      ;2*x
           SUB.W    D2,D1      ;5*x^2 - 2*x
           ADD.W    #6,D1      ;5*x^2 - 2*x + 6
           RTS                 ;return
           
           END      START




              
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
