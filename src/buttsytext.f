C------------------------------------------------------------------------------
C Version 26-November-1996                                   File: buttsytext.f
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
C SUBROUTINE BUTTSYTEXT(YTEXT)
C
C Input: YTEXT
C
C Set the relative y-position of the text baseline in buttons (from 0 to 1)
C
C REAL YTEXT -> = YTEXT_BUTT
C
Comment
C------------------------------------------------------------------------------
C
        SUBROUTINE BUTTSYTEXT(YTEXT)
        IMPLICIT NONE
	REAL YTEXT
        INCLUDE 'button.inc'
C------------------------------------------------------------------------------
	YTEXT_BUTT=YTEXT
        END
