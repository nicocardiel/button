C------------------------------------------------------------------------------
C Version 26-November-1996                                      File: buttsch.f
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
C SUBROUTINE BUTTSCH(SIZE)
C
C Input: SIZE
C
C Set the character height in buttons.
C
C REAL SIZE -> the current font size (dimensionless multiple of the default
C      size)
C
Comment
C------------------------------------------------------------------------------
C
        SUBROUTINE BUTTSCH(SIZE)
        IMPLICIT NONE
	REAL SIZE
        INCLUDE 'button.inc'
C------------------------------------------------------------------------------
	PGSCH_BUTT=SIZE
        END
