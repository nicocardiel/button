!------------------------------------------------------------------------------
! Version 26-November-1996                                      File: buttqpr.f
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
! SUBROUTINE BUTTQPR(X1,X2,Y1,Y2)
!
! Output: X1,X2,Y1,Y2
!
! Return the plot region limits.
!
! REAL X1 -> x-coordinate of the left hand edge of the plot region viewport,
!      in normalized device coordinates
! REAL X2 -> x-coordinate of the right hand edge of the plot region viewport,
!      in normalized device coordinates
! REAL Y1 -> y-coordinate of the bottom edge of the plot region viewport,
!      in normalized device coordinates
! REAL Y2 -> y-coordinate of the top edge of the plot region viewport,
!      in normalized device coordinates
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE BUTTQPR(X1,X2,Y1,Y2)
        IMPLICIT NONE
        REAL X1,X2,Y1,Y2
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
        X1=X1VPORT
        X2=X2VPORT
        Y1=Y1VPORT
        Y2=Y2VPORT
        END SUBROUTINE BUTTQPR
