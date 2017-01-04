C------------------------------------------------------------------------------
C Version 26-November-1996                                      File: rpgband.f
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
C SUBROUTINE RPGBAND(MODE,POSN,XREF,YREF,XC,YC,CH)
C
C Input: MODE,POSN,XREF,YREF
C Output: XC,YC,CH
C
C This routine is similar to PGBAND, but it also allows the utilization of
C buttons in text mode.
C
C INTEGER     MODE -> display mode (see PGPLOT manual)
C INTEGER     POSN -> if POSN=1, the routine positions the cursor at the
C             position specified by XREF,YREF
C REAL        XREF -> reference position
C REAL        YREF -> reference position
C REAL        XC -> the world x-coordinate of the cursor
C REAL        YC -> the world y-coordinate of the cursor
C CHARACTER*1 CH -> the character typed by the user
C
Comment
C------------------------------------------------------------------------------
	SUBROUTINE RPGBAND(MODE,POSN,XREF,YREF,XC,YC,CH)
	IMPLICIT NONE
	INTEGER MODE,POSN
	REAL XREF,YREF,XC,YC
	CHARACTER*1 CH
C
C Comando identico a PGCURSE de PGPLOT pero que en caso de utilizar botones en
C modo texto permite la entrada de los parametros de la subrutina desde
C teclado.
C------------------------------------------------------------------------------
	INCLUDE 'button.inc'
C------------------------------------------------------------------------------
C Variables locales
	INTEGER PGBAND,IDUM
	CHARACTER*1 CBUTTON,CPGPAGE
C------------------------------------------------------------------------------
C------------------------------------------------------------------------------
	IF(MODOTEXT_BUTT)THEN
	  WRITE(*,100)'Are you pressing a button (y/n/#) '
	  CBUTTON=READCBUTT('y','yn#')
	  IF(CBUTTON.EQ.'y')THEN
	    XC=0.
	    YC=0.
	    CH='A'         !caracter devuelto por el boton izquierdo del mouse
	  ELSEIF(CBUTTON.EQ.'n')THEN
	    WRITE(*,100)'XC'
	    XC=READFBUTT('@')
	    WRITE(*,100)'YC'
	    YC=READFBUTT('@')
	    WRITE(*,100)'CH '
	    CH=READCBUTT('A','@')
	  ELSEIF(CBUTTON.EQ.'#')THEN
	    XC=0.
	    YC=0.
	    CH='A'         !caracter devuelto por el boton izquierdo del mouse
	    WRITE(*,100)'Do you want to insert a CALL PGPAGE (y/n) '
	    CPGPAGE=READCBUTT('y','yn')
	    IF(CPGPAGE.EQ.'y')CALL PGPAGE
	  END IF
	ELSE
	  IDUM=PGBAND(MODE,POSN,XREF,YREF,XC,YC,CH)
	  IF(IDUM.EQ.0)THEN
	    WRITE(*,101)'ERROR: in subroutine PGBAND.'
	    WRITE(*,101)'=> returned XC=YC=0.0, CH="X"'
	    XC=0.
	    YC=0.
	    CH='X'
	  END IF
	END IF
C------------------------------------------------------------------------------
100	FORMAT(A,$)
101	FORMAT(A)
	END
