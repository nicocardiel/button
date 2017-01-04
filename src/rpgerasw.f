C------------------------------------------------------------------------------
C Version 18-September-1997                                     File: rpgeras.f
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
C SUBROUTINE RPGERASW(X1,X2,Y1,Y2)
C
C Input: X1,X2,Y1,Y2
C
C Clear any rectangle defined by (X1,Y1) lower left corner
C                                (X2,Y2) upper right corner
C
C REAL X1 -> x-coordinate of the left hand edge of the rectangle to be 
C            cleared,in normalized device coordinates
C REAL X2 -> x-coordinate of the right hand edge of the rectangle to be 
C            cleared,in normalized device coordinates
C REAL Y1 -> y-coordinate of the bottom edge of the rectangle to be 
C            cleared,in normalized device coordinates
C REAL Y2 -> y-coordinate of the top edge of the rectangle to be 
C            cleared,in normalized device coordinates
C
C NOTE: this subroutine preserves the original viewport and window coordinate
C       systems
C
Comment
C------------------------------------------------------------------------------
        SUBROUTINE RPGERASW(X1,X2,Y1,Y2)
        IMPLICIT NONE
	REAL X1,X2,Y1,Y2
C
	INTEGER CI,FS
	REAL XW1,XW2,YW1,YW2
	REAL XV1,XV2,YV1,YV2
C------------------------------------------------------------------------------
	CALL PGBBUF
C
	CALL PGQWIN(XW1,XW2,YW1,YW2)
	CALL PGQVP(0,XV1,XV2,YV1,YV2)
C
        CALL PGVPORT(X1,X2,Y1,Y2)
	CALL PGWINDOW(0.0,1.0,0.0,1.0)
	CALL PGQCI(CI)
	CALL PGQFS(FS)
	CALL PGSCI(0)
	CALL PGSFS(1)
	CALL PGRECT(0.0,1.0,0.0,1.0)
	CALL PGSCI(CI)
	CALL PGSFS(FS)
C
	CALL PGVPORT(XV1,XV2,YV1,YV2)
	CALL PGWINDOW(XW1,XW2,YW1,YW2)
C
	CALL PGEBUF
C
        END
