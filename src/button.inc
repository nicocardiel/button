C------------------------------------------------------------------------------
C Version 26-November-1996                                     File: button.inc
C @ ncl & fjg
C------------------------------------------------------------------------------
C Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
C Universidad Complutense de Madrid, 28040-Madrid, Spain
C E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
C------------------------------------------------------------------------------
C This file is free software; you can redistribute it and/or modify it
C under the terms of the GNU General Public License as published by the Free
C Software Foundation; either version 2 of the License, or (at your option) any
C later version. See the file gnu-public-license.txt for details.
C------------------------------------------------------------------------------
C------------------------------------------------------------------------------
C                      GLOBAL VARIABLES AND PARAMETERS
C------------------------------------------------------------------------------
C------------------------------------------------------------------------------
C maximum number of buttons
	INTEGER MAX_NBUTT
	PARAMETER (MAX_NBUTT=1000)
C maximum number of graphic devices that can be employed simultaneously
	INTEGER MAX_ID_BUTT
	PARAMETER (MAX_ID_BUTT=8)
C------------------------------------------------------------------------------
C maximum number of columns and rows
	INTEGER MAX_XBUTT,MAX_YBUTT
	COMMON/BUTTON1/MAX_XBUTT,MAX_YBUTT
C
C character font in buttons
	INTEGER PGSCF_BUTT
	COMMON/BUTTON2/PGSCF_BUTT
C
C font size in buttons
	REAL PGSCH_BUTT
	COMMON/BUTTON3/PGSCH_BUTT
C
C relative y-position of the text baseline in buttons
	REAL YTEXT_BUTT
	COMMON/BUTTON4/YTEXT_BUTT
C
C Plot region..: X1VPORT,X2VPORT,Y1VPORT,Y2VPORT
C Button region: X3VPORT,X4VPORT,Y3VPORT,Y4VPORT
	REAL X1VPORT,X2VPORT
	REAL X3VPORT,X4VPORT
	REAL Y1VPORT,Y2VPORT
	REAL Y3VPORT,Y4VPORT
	COMMON/BUTTON5/X1VPORT,X2VPORT,X3VPORT,X4VPORT,Y1VPORT,
     +   Y2VPORT,Y3VPORT,Y4VPORT
C
C determines whether the button exist or not
	LOGICAL EXIST_BUTT(MAX_NBUTT)
	COMMON/BUTTON6/EXIST_BUTT
C
C if .TRUE. tick marks are drawn outside the viewport instead of inside
	LOGICAL ITICKS_BUTT
	COMMON/BUTTON7/ITICKS_BUTT
C
C if .TRUE. buttons appear in text mode
	LOGICAL MODOTEXT_BUTT
C if .TRUE. buttons appear in text mode but they are also plotted
	LOGICAL MODOTEXT_PLOTBUTT
	COMMON/BUTTON8/MODOTEXT_BUTT,MODOTEXT_PLOTBUTT
C------------------------------------------------------------------------------
C Miscellany
	INTEGER TBEGBUTT,TLENBUTT
	INTEGER READIBUTT
	REAL READFBUTT
	CHARACTER*255 READCBUTT
C------------------------------------------------------------------------------
