!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttqcf.f
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
! SUBROUTINE BUTTQCF(FONT)
!
! Output: FONT
!
! Return the current character font type in buttons.
!
! INTEGER FONT -> the current font number (in range 1-4)
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE BUTTQCF(FONT)
        IMPLICIT NONE
        INTEGER FONT
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        FONT=PGSCF_BUTT
        END SUBROUTINE BUTTQCF
