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
C SUBROUTINE RPGERAS
C
C Input (COMMON) : X1VPORT,X2VPORT,Y1VPORT,Y2VPORT
C
C Clear the plot region (preserving the button region which does not overlap
C with the plot region).
C
Comment
C------------------------------------------------------------------------------
        SUBROUTINE RPGERAS
        IMPLICIT NONE
C Borra la region de plots
        INCLUDE 'button.inc'
C
	INTEGER CI,FS
C------------------------------------------------------------------------------
	CALL PGBBUF
        CALL PGVPORT(X1VPORT,X2VPORT,Y1VPORT,Y2VPORT)
	CALL PGWINDOW(0.0,1.0,0.0,1.0)
	CALL PGQCI(CI)
	CALL PGQFS(FS)
	CALL PGSCI(0)
	CALL PGSFS(1)
	CALL PGRECT(0.0,1.0,0.0,1.0)
	CALL PGSCI(CI)
	CALL PGSFS(FS)
	CALL PGEBUF
C
        END
