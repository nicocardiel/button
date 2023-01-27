!------------------------------------------------------------------------------
! Version 26-November-1996                                   File: buttsytext.f
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
! SUBROUTINE BUTTSYTEXT(YTEXT)
!
! Input: YTEXT
!
! Set the relative y-position of the text baseline in buttons (from 0 to 1)
!
! REAL YTEXT -> = YTEXT_BUTT
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE BUTTSYTEXT(YTEXT)
        IMPLICIT NONE
        REAL YTEXT
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        YTEXT_BUTT=YTEXT
        END SUBROUTINE BUTTSYTEXT
