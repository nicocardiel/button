C------------------------------------------------------------------------------
C Version 23-July-1998                                           File: sample.f
C------------------------------------------------------------------------------
C Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
C Universidad Complutense de Madrid, 28040-Madrid, Spain
C E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
C------------------------------------------------------------------------------
C This program is free software; you can redistribute it and/or modify it
C under the terms of the GNU General Public License as published by the Free
C Software Foundation; either version 2 of the License, or (at your option) any
C later version. See the file gnu-public-license.txt for details.
C------------------------------------------------------------------------------
       PROGRAM LOGO
       IMPLICIT NONE
C
       INTEGER I,NB,NCOLOR
       INTEGER NTERM,IDN(8),ITERM
       REAL XC,YC
       REAL XX(100),YY(100)
       REAL XV3,XV4,YV3,YV4
       LOGICAL LCOLOR(8)
       CHARACTER*1 CH
C------------------------------------------------------------------------------
C Open graphic output
       CALL RPGBEGIN(NTERM,IDN,LCOLOR)
       CALL BUTTSXB(3)
       CALL BUTTSYB(1)
C Plot buttons
5      CALL BUTTON(1,' ',0)
       CALL BUTTON(3,'EXIT',0)
C Plot box
       DO ITERM=NTERM,1,-1
         CALL PGSLCT(IDN(ITERM))
         IF(ITERM.EQ.1)THEN
           CALL RPGENV(0.,1.,-1.1,1.1,0,0)
         ELSE
           CALL PGENV(0.,1.,-1.1,1.1,0,0)
         END IF
         CALL PGLABEL('X axis','Y axis','Plot label')
       END DO
       NCOLOR=1
C------------------------------------------------------------------------------
10     CONTINUE                                       !main loop: button handle
       CALL RPGBAND(0,0,0.,0.,XC,YC,CH)
       CALL IFBUTTON(XC,YC,NB)
C......
       IF(NB.EQ.0)THEN
         WRITE(*,100)'Cursor at:'
         WRITE(*,*)XC,YC
C......
       ELSEIF(NB.EQ.3)THEN
         CALL BUTTON(3,'EXIT',5)
         WRITE(*,100)'Press <CR> to EXIT'
         READ(*,*)
         GOTO 20
       END IF
C
       GOTO 10
C------------------------------------------------------------------------------
20     CONTINUE                                !end of main loop: button handle
C
       CALL PGEND
C
       STOP
100    FORMAT(A,$)
       END
