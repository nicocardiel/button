C------------------------------------------------------------------------------
C Version 25-November-1996                                       File: rpgenv.f
C------------------------------------------------------------------------------
C Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
C Universidad Complutense de Madrid, 28040-Madrid, Spain
C E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
C------------------------------------------------------------------------------
C This routine is free software; you can redistribute it and/or modify it
C under the terms of the GNU General Public License as published by the Free
C Software Foundation; either version 2 of the License, or (at your option) any
C later version. See the file gnu-public-license.txt for details.
C------------------------------------------------------------------------------
Comment
C
C SUBROUTINE RPGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
C
C Input: XMIN,XMAX,YMIN,YMAX,JUST,AXIS
C Input (COMMON): ITICKS_BUTT
C
C Perform the same functions than PGENV, although the plot surface is
C restricted to the rectangle defined by X1VPORT,X2VPORT,Y1VPORT,Y2VPORT.
C Other important difference with PGENV is that RPGENV does not clear the
C plot region of the new plot. A previous call to PGADVANCE, PGPAGE, PGERAS 
C (RPGERAS, RPGERASB or RPGERASW) is required. The arguments of this routine 
C are exactly the same than those in PGENV:
C
C REAL    XMIN -> the world x-coordinate at the bottom left corner of the
C                 viewport
C REAL    XMAX -> the world x-coordinate at the top right corner of the
C                 viewport
C REAL    YMIN -> the world y-coordinate at the bottom left corner of the
C                 viewport
C REAL    YMAX -> the world y-coordinate at the top right corner of the
C                 viewport
C INTEGER JUST -> if JUST=1, the scales of the x and y axes (in world
C                 coordinates per inch) will be equal, otherwise they will be
C                 scaled independently
C INTEGER AXIS -> controls the plotting of axes, tick marks, etc:
C         AXIS = -2: draw no box, axes or labels
C         AXIS = -1: draw box only
C         AXIS =  0: draw box and label it with coordinates
C         AXIS =  1: same as AXIS=0, but also draw the coordinate axes
C         AXIS =  2: same as AXIS=1, but also draw grid lines
C         AXIS = 10: draw box and label X-axis logarithmically
C         AXIS = 20: draw box and label Y-axis logarithmically
C         AXIS = 30: draw box and label both axes logarithmically
C
Comment
C------------------------------------------------------------------------------
C
	SUBROUTINE RPGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
	IMPLICIT NONE
	REAL XMIN,XMAX,YMIN,YMAX
	INTEGER JUST,AXIS
C
C Comando identico a PGENV de PGPLOT pero restringido a la region
C de plots. Subrutina copiada de codigo de PGENV de [TJP]
C------------------------------------------------------------------------------
	INCLUDE 'button.inc'
C------------------------------------------------------------------------------
C Variables locales
	CHARACTER*10 XOPTS,YOPTS
C------------------------------------------------------------------------------
C------------------------------------------------------------------------------
	IF((MODOTEXT_BUTT).AND.(.NOT.MODOTEXT_PLOTBUTT))THEN
	  CALL PGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
	  RETURN
	END IF
C
	CALL PGVPORT(X1VPORT,X2VPORT,Y1VPORT,Y2VPORT)
	IF(XMIN.EQ.XMAX)THEN
	  WRITE(*,101)'invalid x limits in RPGENV: XMIN = XMAX.'
	  RETURN
	ELSE IF(YMIN.EQ.YMAX)THEN
	  WRITE(*,101)'invalid y limits in RPGENV: YMIN = YMAX.'
	  RETURN
	END IF
C
	IF(JUST.EQ.1)THEN
	  CALL PGWNAD(XMIN,XMAX,YMIN,YMAX)
	ELSE
	  CALL PGSWIN(XMIN,XMAX,YMIN,YMAX)
	END IF
C
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
C invert tick marks if necessary
	IF(ITICKS_BUTT)THEN
	  XOPTS=XOPTS(1:TLENBUTT(XOPTS))//'I'
	  YOPTS=YOPTS(1:TLENBUTT(YOPTS))//'I'
	END IF
C draw box
	CALL PGBOX(XOPTS,0.0,0,YOPTS,0.0,0)
C
101	FORMAT(A)
	END
