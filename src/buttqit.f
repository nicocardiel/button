C------------------------------------------------------------------------------
C Version 26-November-1996                                      File: buttqit.f
C------------------------------------------------------------------------------
C Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
C Universidad Complutense de Madrid, 28040-Madrid, Spain
C E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
C------------------------------------------------------------------------------
C This routine is free software; you can redistribute it and/or modify it
C under the terms of the GNU General Public License as published by the Free
C Software Foundation; either version 2 of the License, or (at your option) any
C later version. See the file gnu-public-license.txt for details.
C------------------------------------------------------------------------------
Comment
C
C SUBROUTINE BUTTQIT(LOUTSIDE)
C
C Output: LOUTSIDE
C
C Return whether tick marks are drawn outside the viewport instead of inside.
C
C LOGICAL LOUTSIDE -> .TRUE. if ticks are drawn outside the viewport
C
Comment
C------------------------------------------------------------------------------
C
        SUBROUTINE BUTTQIT(LOUTSIDE)
        IMPLICIT NONE
	LOGICAL LOUTSIDE
        INCLUDE 'button.inc'
C------------------------------------------------------------------------------
	LOUTSIDE=ITICKS_BUTT
        END
