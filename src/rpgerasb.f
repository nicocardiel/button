C------------------------------------------------------------------------------
C Version 18-September-1997                                    File: rpgerasb.f
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
C SUBROUTINE RPGERASB
C
C Input (COMMON) : X3VPORT,X4VPORT,Y3VPORT,Y4VPORT
C
C Clear the button region (preserving the plot region which does not overlap
C with the plot region).
C
Comment
C------------------------------------------------------------------------------
        SUBROUTINE RPGERASB
        IMPLICIT NONE
C Borra la region de plots
        INCLUDE 'button.inc'
C
	INTEGER CI,FS
C------------------------------------------------------------------------------
	CALL PGBBUF
        CALL PGVPORT(X3VPORT,X4VPORT,Y3VPORT,Y4VPORT)
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
	IF(MODOTEXT_BUTT) WRITE(*,101) '^[[1;1f^[[J'
C
101	FORMAT(A)
        END
