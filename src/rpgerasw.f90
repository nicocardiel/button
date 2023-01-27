!------------------------------------------------------------------------------
! Version 10-July-2000                                          File: rpgeras.f
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
! SUBROUTINE RPGERASW(X1,X2,Y1,Y2,NCOLOR)
!
! Input: X1,X2,Y1,Y2,NCOLOR
!
! Clear any rectangle defined by (X1,Y1) lower left corner
!                                (X2,Y2) upper right corner
!
! REAL X1 -> x-coordinate of the left hand edge of the rectangle to be 
!            cleared,in normalized device coordinates
! REAL X2 -> x-coordinate of the right hand edge of the rectangle to be 
!            cleared,in normalized device coordinates
! REAL Y1 -> y-coordinate of the bottom edge of the rectangle to be 
!            cleared,in normalized device coordinates
! REAL Y2 -> y-coordinate of the top edge of the rectangle to be 
!            cleared,in normalized device coordinates
! INTEGER NCOLOR -> background color
!
! NOTE: this subroutine preserves the original viewport and window coordinate
!       systems
!
!omment
!------------------------------------------------------------------------------
        SUBROUTINE RPGERASW(X1,X2,Y1,Y2,NCOLOR)
        IMPLICIT NONE
        REAL X1,X2,Y1,Y2
        INTEGER NCOLOR
!
        INTEGER CI,FS
        REAL XW1,XW2,YW1,YW2
        REAL XV1,XV2,YV1,YV2
!------------------------------------------------------------------------------
        CALL PGBBUF
!
        CALL PGQWIN(XW1,XW2,YW1,YW2)
        CALL PGQVP(0,XV1,XV2,YV1,YV2)
!
        CALL PGVPORT(X1,X2,Y1,Y2)
        CALL PGWINDOW(0.0,1.0,0.0,1.0)
        CALL PGQCI(CI)
        CALL PGQFS(FS)
        CALL PGSCI(NCOLOR)
        CALL PGSFS(1)
        CALL PGRECT(0.0,1.0,0.0,1.0)
        CALL PGSCI(CI)
        CALL PGSFS(FS)
!
        CALL PGVPORT(XV1,XV2,YV1,YV2)
        CALL PGWINDOW(XW1,XW2,YW1,YW2)
!
        CALL PGEBUF
!
        END SUBROUTINE RPGERASW
