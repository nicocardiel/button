!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttqyb.f
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
! SUBROUTINE BUTTQYB(NB)
!
! Output: NB
!
! Return MAX_YBUTT.
!
! INTEGER NB -> = MAX_YBUTT
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE BUTTQYB(NB)
        IMPLICIT NONE
        INTEGER NB
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        NB=MAX_YBUTT
        END SUBROUTINE BUTTQYB
