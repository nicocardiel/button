!------------------------------------------------------------------------------
! Version 18-September-1997                                     File: rpgeras.f
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
! SUBROUTINE RPGERAS
!
! Input (COMMON) : X1VPORT,X2VPORT,Y1VPORT,Y2VPORT
!
! Clear the plot region (preserving the button region which does not overlap
! with the plot region).
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE RPGERAS
        IMPLICIT NONE
! Borra la region de plots
        INCLUDE 'button.inc'
!
        INTEGER CI,FS
!------------------------------------------------------------------------------
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
!
        END SUBROUTINE RPGERAS
