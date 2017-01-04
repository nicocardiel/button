C------------------------------------------------------------------------------
C Version 26-November-1996                                      File: buttscf.f
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
C SUBROUTINE BUTTSCF(FONT)
C
C Input : FONT
C
C Set the character font type in buttons.
C
C INTEGER FONT -> the current font number (in range 1-4)
C
Comment
C------------------------------------------------------------------------------
C
        SUBROUTINE BUTTSCF(FONT)
        IMPLICIT NONE
	INTEGER FONT
        INCLUDE 'button.inc'
C------------------------------------------------------------------------------
	IF((FONT.LT.1).OR.(FONT.GT.4))THEN
	  WRITE(*,101)'ERROR: invalid font type in subroutine BUTTSCF.'
	  WRITE(*,101)'=> previous font type unchanged'
	  RETURN
	END IF
	PGSCF_BUTT=FONT
101	FORMAT(A)
        END
