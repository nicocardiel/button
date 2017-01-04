C------------------------------------------------------------------------------
C Version 26-November-1996                                     File: rpgbegin.f
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
C SUBROUTINE RPGBEGIN(NTERM,IDN,LCOLOR)
C
C Output: NTERM,IDN,LCOLOR
C Output (COMMON): all global variables in button.inc
C
C Open the graphic device(s) and assign the default values to the global
C variables:
C	MAX_XBUTT=6
C	MAX_YBUTT=2
C	PGSCF_BUTT=2
C	PGSCH_BUTT=1.
C	YTEXT_BUTT=0.35
C	X1VPORT=0.1
C	X2VPORT=0.95
C	Y1VPORT=0.1
C	Y2VPORT=0.70
C	X3VPORT=0.05
C	X4VPORT=0.95
C	Y3VPORT=0.80
C	Y4VPORT=0.95
C
C INTEGER NTERM -> number of opened graphic devices to be employed
C         simultaneously
C INTEGER IDN(8) -> identifier of the openned graphic devices
C         (positive values returned by PGOPEN)
C LOGICAL LCOLOR(8) -> determines whether color is available or not
C         in each opened graphic device
C
C
Comment
C------------------------------------------------------------------------------
	SUBROUTINE RPGBEGIN(NTERM,IDN,LCOLOR)
	IMPLICIT NONE
C------------------------------------------------------------------------------
	INCLUDE 'button.inc'
C------------------------------------------------------------------------------
C subroutine parameters
	INTEGER NTERM  !number of graphic devices to be employed simultaneously
	INTEGER IDN(MAX_ID_BUTT)      !identification number of graphic devices
	LOGICAL LCOLOR(MAX_ID_BUTT)      !determines whether color is available
C
C local variables
	INTEGER ID0
	INTEGER I,LDEV,LTER
	INTEGER PGOPEN
	INTEGER CI1,CI2
	CHARACTER*1 CBUT
	CHARACTER*255 TERMINAL,DEFDEV
	LOGICAL LOOP
C------------------------------------------------------------------------------
        CALL GRGENV('DEV',DEFDEV,LDEV)
C determinamos si los botones se muestran en modo texto
	WRITE(*,100)'Are you using graphic buttons............(y/n) '
	CBUT=READCBUTT('y','yn')
	MODOTEXT_BUTT=(CBUT.EQ.'n')
	IF(MODOTEXT_BUTT)THEN
	  WRITE(*,*)
	  WRITE(*,100)'WARNING: remember to enlarge the terminal width '
	  WRITE(*,101)'to hold all the text-buttons.'
	  WRITE(*,100)'Do you want to plot the buttons anyway...(y/n) '
	  CBUT=READCBUTT('y','yn')
	  MODOTEXT_PLOTBUTT=(CBUT.EQ.'y')
	  WRITE(*,'(A)')'[1;1f[J'
	ELSE
	  MODOTEXT_PLOTBUTT=.FALSE.
	END IF
C open graphic output for plots
	LOOP=.TRUE.
	NTERM=0
	DO WHILE(LOOP)
	  IF(NTERM.GT.0)THEN
            WRITE(*,115)'Graphic device #',NTERM+1,' (NONE=EXIT)'
	  ELSE
            WRITE(*,100)'Graphic device #1'
	  END IF
          IF(LDEV.EQ.0)THEN
            CALL PGLDEV
	    IF(NTERM.GT.0)THEN
	      WRITE(*,100)' '
              TERMINAL=READCBUTT('NONE','@')
	    ELSE
              TERMINAL=READCBUTT('@','@')
	    END IF
          ELSE
            WRITE(*,100)' (? to see list) '
	    IF(NTERM.GT.0)THEN
              TERMINAL=READCBUTT('NONE','@')
	    ELSE
              TERMINAL=READCBUTT(DEFDEV(1:LDEV),'@')
	    END IF
            IF(TERMINAL.EQ.'?')THEN
              CALL PGLDEV
              WRITE(*,115)'Graphic device #',NTERM+1,' '
              TERMINAL=READCBUTT(DEFDEV(1:LDEV),'@')
            END IF
          END IF
	  IF(TERMINAL.NE.'NONE')THEN
	    LTER=TLENBUTT(TERMINAL)
	    ID0=PGOPEN(TERMINAL(1:LTER))
	    IF(ID0.LE.0)THEN
	      WRITE(*,101)'ERROR: unable to open graphic device. '//
     +         'Please, try again.'
	      ID0=PGOPEN('?')
	      IF(ID0.LE.0)THEN
	        WRITE(*,101)'FATAL ERROR: unable to open graphic device.'
	        STOP
	      END IF
	    END IF
	    NTERM=NTERM+1
	    IDN(NTERM)=ID0
	    LOOP=(NTERM.LT.MAX_ID_BUTT)
	    CALL PGASK(.FALSE.)
	    CALL PGQCOL(CI1,CI2)
	    LCOLOR(NTERM)=(CI2.GE.15)
	  ELSE
	    IF(NTERM.EQ.0)THEN
	      WRITE(*,101)'ERROR: you must define at least one '//
     +         'graphic device.'
	    ELSE
	      LOOP=.FALSE.
	    END IF
	  END IF
	END DO
C dejamos como ultima ventana activa la primera (si hay mas de una)
	IF(NTERM.GT.1)THEN
	  CALL PGSLCT(IDN(1))
	END IF
C definimos las variables de entorno por defecto
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
C ningun boton ha sido dibujado todavia
	DO I=1,MAX_NBUTT
	  EXIST_BUTT(I)=.FALSE.
	END DO
C los ticks se dibujan hacia dentro
	ITICKS_BUTT=.FALSE.
C
C Redefinimos colores (salida grafica con grises)
C   0: negro
C   1: blanco
C  12: gris intermedio
C  13: gris claro
C  14: gris oscuro
C  15: casi gris intermedio
	CALL PGSCR(12,0.5,0.5,0.5)
	CALL PGSCR(13,0.7,0.7,0.7)
	CALL PGSCR(14,0.3,0.3,0.3)
	CALL PGSCR(15,0.6,0.6,0.6)
C definimos un viewport y un window por defecto
ccc	CALL PGVPORT(X1VPORT,X2VPORT,Y1VPORT,Y2VPORT)
ccc	CALL PGWINDOW(0.,1.,0.,1.)
ccc	CALL PGPAGEB_RED
ccc	CALL PGPAGE_RED
C------------------------------------------------------------------------------
100	FORMAT(A,$)
101	FORMAT(A)
115	FORMAT(A,I1,A,$)
	END
