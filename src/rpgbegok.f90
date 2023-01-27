!------------------------------------------------------------------------------
! Version 4-Januay-1999                                        File: rpgbegok.f
!------------------------------------------------------------------------------
! Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
! Universidad Complutense de Madrid, 28040-Madrid, Spain
! E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
!------------------------------------------------------------------------------
! This routine is free software; you can redistribute it and/or modify it
! under the terms of the GNU General Public License as published by the Free
! Software Foundation; either version 2 of the License, or (at your option) any
! later version. See the file gnu-public-license.txt for details.
!------------------------------------------------------------------------------
!omment
!
! SUBROUTINE RPGBEGOK(TTERM,IMODE)
! 
! Input: TTERM,IMODE
! Output (COMMON): all global variables in button.inc
!
! Open the graphic device TTERM and assign the default values to the global
! variables:
!        MAX_XBUTT=6
!        MAX_YBUTT=2
!        PGSCF_BUTT=2
!        PGSCH_BUTT=1.
!        YTEXT_BUTT=0.35
!        X1VPORT=0.1
!        X2VPORT=0.95
!        Y1VPORT=0.1
!        Y2VPORT=0.70
!        X3VPORT=0.05
!        X4VPORT=0.95
!        Y3VPORT=0.80
!        Y4VPORT=0.95
!
! CHARACTER*(*) TTERM -> graphic device to be opened
! INTEGER       IMODE -> define the mode to operate with the buttons:
!                        IMODE=0: graphics button
!                        IMODE=1: text buttons (but plot graphic buttons)
!                        IMODE=2: text buttons (without graphic buttons)
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE RPGBEGOK(TTERM,IMODE)
        IMPLICIT NONE
!
        INCLUDE 'button.inc'
!
        CHARACTER*(*) TTERM
        INTEGER IMODE
!
        INTEGER I
!------------------------------------------------------------------------------
        INQUIRE(FILE='.button_modoover',EXIST=MODOOVER_BUTT)
! abrimos la salida grafica
        CALL PGBEGIN(0,TTERM,1,1)
        CALL PGASK(.FALSE.)
! definimos las variables de entorno por defecto
        MAX_XBUTT=6
        MAX_YBUTT=2
        PGSCF_BUTT=2
        PGSCH_BUTT=1.
        YTEXT_BUTT=0.35
        X1VPORT=0.1
        X2VPORT=0.95
        Y1VPORT=0.1
        Y2VPORT=0.70
        X3VPORT=0.05
        X4VPORT=0.95
        Y3VPORT=0.80
        Y4VPORT=0.95
! ningun boton ha sido dibujado todavia
        DO I=1,MAX_NBUTT
          EXIST_BUTT(I)=.FALSE.
        END DO
! los ticks se dibujan hacia dentro
        ITICKS_BUTT=.FALSE.
!
! Redefinimos colores (salida grafica con grises)
!   0: negro
!   1: blanco
!  12: gris intermedio
!  13: gris claro
!  14: gris oscuro
!  15: casi gris intermedio
        CALL PGSCR(12,0.5,0.5,0.5)
        CALL PGSCR(13,0.7,0.7,0.7)
        CALL PGSCR(14,0.3,0.3,0.3)
        CALL PGSCR(15,0.6,0.6,0.6)
! colores definidos para background en llamadas a RPGERASW
        CALL PGSCR( 8,0.40,0.40,0.00)
        CALL PGSCR( 9,0.10,0.10,0.40)
        CALL PGSCR(10,0.40,0.10,0.10)
        CALL PGSCR(11,0.10,0.40,0.40)
! definimos el modo de trabajar con los botones
        IF(IMODE.EQ.0)THEN
          MODOTEXT_BUTT=.FALSE.
          MODOTEXT_PLOTBUTT=.FALSE.
        ELSEIF(IMODE.EQ.1)THEN
          MODOTEXT_BUTT=.TRUE.
          MODOTEXT_PLOTBUTT=.TRUE.
        ELSEIF(IMODE.EQ.2)THEN
          MODOTEXT_BUTT=.TRUE.
          MODOTEXT_PLOTBUTT=.FALSE.
        ELSE
          WRITE(*,101)'ERROR: invalid IMODE in subroutine RPGBEGOK'
          WRITE(*,100)'Press <CR> to continue...'
          READ(*,*)
          MODOTEXT_BUTT=.FALSE.
          MODOTEXT_PLOTBUTT=.FALSE.
        END IF
!------------------------------------------------------------------------------
100     FORMAT(A,$)
101     FORMAT(A)
        END SUBROUTINE RPGBEGOK
