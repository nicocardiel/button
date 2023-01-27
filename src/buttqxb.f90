!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttqxb.f
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
! SUBROUTINE BUTTQXB(NB)
!
! Output: NB
!
! Return MAX_XBUTT.
!
! INTEGER NB -> = MAX_XBUTT
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE BUTTQXB(NB)
        IMPLICIT NONE
        INTEGER NB
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        NB=MAX_XBUTT
        END SUBROUTINE BUTTQXB
