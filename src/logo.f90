!------------------------------------------------------------------------------
! Version 23-July-1998                                           File: sample.f
!------------------------------------------------------------------------------
! Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
! Universidad Complutense de Madrid, 28040-Madrid, Spain
! E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
!------------------------------------------------------------------------------
! This program is free software; you can redistribute it and/or modify it
! under the terms of the GNU General Public License as published by the Free
! Software Foundation; either version 2 of the License, or (at your option) any
! later version. See the file gnu-public-license.txt for details.
!------------------------------------------------------------------------------
       PROGRAM LOGO
       IMPLICIT NONE
!
       INTEGER I,NB,NCOLOR
       INTEGER NTERM,IDN(8),ITERM
       REAL XC,YC
       REAL XX(100),YY(100)
       REAL XV3,XV4,YV3,YV4
       LOGICAL LCOLOR(8)
       CHARACTER*1 CH
!------------------------------------------------------------------------------
! Open graphic output
       CALL RPGBEGIN(NTERM,IDN,LCOLOR)
       CALL BUTTSXB(3)
       CALL BUTTSYB(1)
! Plot buttons
5      CALL BUTTON(1,' ',0)
       CALL BUTTON(3,'EXIT',0)
! Plot box
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
!------------------------------------------------------------------------------
10     CONTINUE                                       !main loop: button handle
       CALL RPGBAND(0,0,0.,0.,XC,YC,CH)
       CALL IFBUTTON(XC,YC,NB)
!......
       IF(NB.EQ.0)THEN
         WRITE(*,100)'Cursor at:'
         WRITE(*,*)XC,YC
!......
       ELSEIF(NB.EQ.3)THEN
         CALL BUTTON(3,'EXIT',5)
         WRITE(*,100)'Press <CR> to EXIT'
         READ(*,*)
         GOTO 20
       END IF
!
       GOTO 10
!------------------------------------------------------------------------------
20     CONTINUE                                !end of main loop: button handle
!
       CALL PGEND
!
       STOP
100    FORMAT(A,$)
       END PROGRAM LOGO
