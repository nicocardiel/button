!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttsex.f
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
! SUBROUTINE BUTTSEX(NBUT,LEXIST)
!
! Input: NBUT,LEXIST
!
! Set whether the asked button is active (currently available) or not.
!
! INTEGER NBUT -> button number
! LOGICAL LEXIST -> .TRUE. if the button is active, .FALSE. otherwise
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE BUTTSEX(NBUT,LEXIST)
        IMPLICIT NONE
        INTEGER NBUT
        LOGICAL LEXIST
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        IF((NBUT.LT.1).OR.(NBUT.GT.MAX_NBUTT))THEN
          WRITE(*,101)'ERROR: button number out of limits in subroutine BUTTSEX.'
          LEXIST=.FALSE.
          RETURN
        END IF
        EXIST_BUTT(NBUT)=LEXIST
101     FORMAT(A)
        END SUBROUTINE BUTTSEX
