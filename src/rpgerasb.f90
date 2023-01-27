!------------------------------------------------------------------------------
! Version 18-September-1997                                    File: rpgerasb.f
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
! SUBROUTINE RPGERASB
!
! Input (COMMON) : X3VPORT,X4VPORT,Y3VPORT,Y4VPORT
!
! Clear the button region (preserving the plot region which does not overlap
! with the plot region).
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE RPGERASB
        IMPLICIT NONE
! Borra la region de plots
        INCLUDE 'button.inc'
!
        INTEGER CI,FS
!------------------------------------------------------------------------------
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
!
        IF(MODOTEXT_BUTT) WRITE(*,101) '^[[1;1f^[[J'
!
101     FORMAT(A)
        END SUBROUTINE RPGERASB
