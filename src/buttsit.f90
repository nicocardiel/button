!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttsit.f
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
! SUBROUTINE BUTTSIT(LOUTSIDE)
!
! Input: LOUTSIDE
!
! Set whether tick marks are drawn outside the viewport instead of inside.
!
! LOGICAL LOUTSIDE -> .TRUE. if ticks are drawn outside the viewport
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE BUTTSIT(LOUTSIDE)
        IMPLICIT NONE
        LOGICAL LOUTSIDE
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        ITICKS_BUTT=LOUTSIDE
        END SUBROUTINE BUTTSIT
