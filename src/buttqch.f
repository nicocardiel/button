C------------------------------------------------------------------------------
C Version 26-November-1996                                      File: buttqch.f
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
C SUBROUTINE BUTTQCH(SIZE)
C
C Output: SIZE
C
C Return the current character font size in buttons.
C
C REAL SIZE -> the current font size (dimensionless multiple of the default
C      size)
C
Comment
C------------------------------------------------------------------------------

C Return the current character height in buttons
C
        SUBROUTINE BUTTQCH(SIZE)
        IMPLICIT NONE
	REAL SIZE
        INCLUDE 'button.inc'
C------------------------------------------------------------------------------
	SIZE=PGSCH_BUTT
        END
