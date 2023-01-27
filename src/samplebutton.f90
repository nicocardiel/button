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
       PROGRAM SAMPLE
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
! Plot buttons
5      CALL BUTTON(1,'sin',0)
       CALL BUTTON(2,'cos',0)
       CALL BUTTON(3,'clear',0)
       CALL BUTTON(4,'color',0)
       CALL BUTTON(6,'EXIT',0)
       CALL BUTTON(7,'mode 0',0)
       CALL BUTTON(8,'mode 1',0)
       CALL BUTTON(8,'mode 1',1)
       CALL BUTTON(9,'mode 2',0)
       CALL BUTTON(10,'mode 3',0)
       CALL BUTTON(10,'mode 3',3)
       CALL BUTTON(11,'mode 4',4)
       CALL BUTTON(12,'mode 5',5)
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
       ELSEIF(NB.EQ.6)THEN
         CALL BUTTON(6,'EXIT',5)
         WRITE(*,100)'Press <CR> to EXIT'
         READ(*,*)
         GOTO 20
!......
       ELSEIF(NB.EQ.1)THEN                                  !plot sine function
         CALL BUTTON(1,'sin',5)
         DO I=1,100
           XX(I)=REAL(I-1)/99.*2.*3.141593
           YY(I)=SIN(XX(I))
           XX(I)=XX(I)/(2.*3.141593)
         END DO
         DO ITERM=NTERM,1,-1
           CALL PGSLCT(IDN(ITERM))
           IF((NCOLOR.NE.1).AND.(LCOLOR(ITERM))) CALL PGSCI(NCOLOR)
           CALL PGLINE(100,XX,YY)
           IF((NCOLOR.NE.1).AND.(LCOLOR(ITERM))) CALL PGSCI(1)
         END DO
         CALL BUTTON(1,'sin',0)
!......
       ELSEIF(NB.EQ.2)THEN                                !plot cosine function
         CALL BUTTON(2,'cos',5)
         DO I=1,100
           XX(I)=REAL(I-1)/99.*2.*3.141593
           YY(I)=COS(XX(I))
           XX(I)=XX(I)/(2.*3.141593)
         END DO
         DO ITERM=NTERM,1,-1
           CALL PGSLCT(IDN(ITERM))
           IF((NCOLOR.NE.1).AND.(LCOLOR(ITERM))) CALL PGSCI(NCOLOR)
           CALL PGLINE(100,XX,YY)
           IF((NCOLOR.NE.1).AND.(LCOLOR(ITERM))) CALL PGSCI(1)
         END DO
         CALL BUTTON(2,'cos',0)
!......
       ELSEIF(NB.EQ.3)THEN                                          !clear plot
         CALL BUTTON(3,'clear',5)
         DO ITERM=NTERM,1,-1
           CALL PGSLCT(IDN(ITERM))
           CALL BUTTQBR(XV3,XV4,YV3,YV4)
           CALL RPGERASW(0.,1.,0.,YV3,0)
         END DO
         GOTO 5
!......
       ELSEIF(NB.EQ.4)THEN                                        !change color
         CALL BUTTON(4,'color',5)
         WRITE(*,100)'Current PGPLOT color is number: '
         WRITE(*,*)NCOLOR
         WRITE(*,100)'Enter new PGPLOT color number: '
         READ(*,*) NCOLOR
         CALL BUTTON(4,'color',0)
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
       END PROGRAM SAMPLE
