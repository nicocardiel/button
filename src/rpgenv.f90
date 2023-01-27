!------------------------------------------------------------------------------
! Version 25-November-1996                                       File: rpgenv.f
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
! SUBROUTINE RPGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
!
! Input: XMIN,XMAX,YMIN,YMAX,JUST,AXIS
! Input (COMMON): ITICKS_BUTT
!
! Perform the same functions than PGENV, although the plot surface is
! restricted to the rectangle defined by X1VPORT,X2VPORT,Y1VPORT,Y2VPORT.
! Other important difference with PGENV is that RPGENV does not clear the
! plot region of the new plot. A previous call to PGADVANCE, PGPAGE, PGERAS 
! (RPGERAS, RPGERASB or RPGERASW) is required. The arguments of this routine 
! are exactly the same than those in PGENV:
!
! REAL    XMIN -> the world x-coordinate at the bottom left corner of the
!                 viewport
! REAL    XMAX -> the world x-coordinate at the top right corner of the
!                 viewport
! REAL    YMIN -> the world y-coordinate at the bottom left corner of the
!                 viewport
! REAL    YMAX -> the world y-coordinate at the top right corner of the
!                 viewport
! INTEGER JUST -> if JUST=1, the scales of the x and y axes (in world
!                 coordinates per inch) will be equal, otherwise they will be
!                 scaled independently
! INTEGER AXIS -> controls the plotting of axes, tick marks, etc:
!         AXIS = -2: draw no box, axes or labels
!         AXIS = -1: draw box only
!         AXIS =  0: draw box and label it with coordinates
!         AXIS =  1: same as AXIS=0, but also draw the coordinate axes
!         AXIS =  2: same as AXIS=1, but also draw grid lines
!         AXIS = 10: draw box and label X-axis logarithmically
!         AXIS = 20: draw box and label Y-axis logarithmically
!         AXIS = 30: draw box and label both axes logarithmically
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE RPGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
        IMPLICIT NONE
        REAL XMIN,XMAX,YMIN,YMAX
        INTEGER JUST,AXIS
!
! Comando identico a PGENV de PGPLOT pero restringido a la region
! de plots. Subrutina copiada de codigo de PGENV de [TJP]
!------------------------------------------------------------------------------
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
! Variables locales
        CHARACTER*10 XOPTS,YOPTS
!------------------------------------------------------------------------------
!------------------------------------------------------------------------------
        IF((MODOTEXT_BUTT).AND.(.NOT.MODOTEXT_PLOTBUTT))THEN
          CALL PGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
          RETURN
        END IF
!
        CALL PGVPORT(X1VPORT,X2VPORT,Y1VPORT,Y2VPORT)
        IF(XMIN.EQ.XMAX)THEN
          WRITE(*,101)'invalid x limits in RPGENV: XMIN = XMAX.'
          RETURN
        ELSE IF(YMIN.EQ.YMAX)THEN
          WRITE(*,101)'invalid y limits in RPGENV: YMIN = YMAX.'
          RETURN
        END IF
!
        IF(JUST.EQ.1)THEN
          CALL PGWNAD(XMIN,XMAX,YMIN,YMAX)
        ELSE
          CALL PGSWIN(XMIN,XMAX,YMIN,YMAX)
        END IF
!
        YOPTS='*'
        IF(AXIS.EQ.-2)THEN
          XOPTS= CHAR(32)
        ELSE IF(AXIS.EQ.-1)THEN
          XOPTS='BC'
        ELSE IF(AXIS.EQ.0)THEN
          XOPTS='BCNST'
        ELSE IF(AXIS.EQ.1)THEN
          XOPTS='ABCNST'
        ELSE IF(AXIS.EQ.2)THEN
          XOPTS='ABCGNST'
        ELSE IF(AXIS.EQ.10)THEN
          XOPTS='BCNSTL'
          YOPTS='BCNST'
        ELSE IF(AXIS.EQ.20)THEN
          XOPTS='BCNST'
          YOPTS='BCNSTL'
        ELSE IF(AXIS.EQ.30)THEN
          XOPTS='BCNSTL'
          YOPTS='BCNSTL'
        ELSE
          WRITE(*,101)'RPGENV: illegal AXIS argument.'
          XOPTS='BCNST'
        END IF
        IF(YOPTS.EQ.'*') YOPTS=XOPTS
! invert tick marks if necessary
        IF(ITICKS_BUTT)THEN
          XOPTS=XOPTS(1:TRUELEN(XOPTS))//'I'
          YOPTS=YOPTS(1:TRUELEN(YOPTS))//'I'
        END IF
! draw box
        CALL PGBOX(XOPTS,0.0,0,YOPTS,0.0,0)
!
101     FORMAT(A)
        END SUBROUTINE RPGENV
