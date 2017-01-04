C------------------------------------------------------------------------------
C Version 13-November-1998                                      File: buttmis.f
C------------------------------------------------------------------------------
C Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
C Universidad Complutense de Madrid, 28040-Madrid, Spain
C E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
C------------------------------------------------------------------------------
C These routines are free software; you can redistribute them and/or modify them
C under the terms of the GNU General Public License as published by the Free
C Software Foundation; either version 2 of the License, or (at your option) any
C later version. See the file gnu-public-license.txt for details.
C------------------------------------------------------------------------------
Comment
C
C BUTTMIS
C
C This file contains subroutines and functions which are similar to other
C already defined for REDUCEME, namely TRUELEN, TRUEBEG, READI, READC, READF, 
C LRUNX and RMBLANK. We duplicate them in order to create a library which must
C work independtly of REDUCEME.
C
C INTEGER FUNCTION TLENBUTT(CADENA)
C INTEGER FUNCTION TBEGBUTT(CADENA)
C INTEGER FUNCTION READIBUTT(CDEF)
C CHARACTER*(*) FUNCTION READCBUTT(CDEF,CVAL)
C REAL FUNCTION READFBUTT(CDEF)
C SUBROUTINE LRUNXBUTT(LRUN,LMANUAL)
C SUBROUTINE RMBLANKBUTT(C1,C2,L)
C
Comment
C------------------------------------------------------------------------------
C Miscellany
C******************************************************************************
C return the position of the last non-blank character in CADENA
	INTEGER FUNCTION TLENBUTT(CADENA)
        IMPLICIT NONE
        CHARACTER*(*) CADENA
C
        INTEGER I,L
C------------------------------------------------------------------------------
        L=LEN(CADENA)
C
        DO I=L,1,-1
          IF(ICHAR(CADENA(I:I)).GT.32)THEN
            TLENBUTT=I
            RETURN
          END IF
        END DO
        TLENBUTT=0
        END
C******************************************************************************
C return the position of the first non-blank character in CADENA
	INTEGER FUNCTION TBEGBUTT(CADENA)
        IMPLICIT NONE
        CHARACTER*(*) CADENA
C
        INTEGER I,L
C------------------------------------------------------------------------------
        L=LEN(CADENA)
C
        DO I=1,L
          IF(ICHAR(CADENA(I:I)).GT.32)THEN
            TBEGBUTT=I
            RETURN
          END IF
        END DO
        TBEGBUTT=0
        END
C******************************************************************************
C return an integer number
C CDEF: character string with default value
	INTEGER FUNCTION READIBUTT(CDEF)
	IMPLICIT NONE
	CHARACTER*(*) CDEF
C
	INTEGER I,L1,L2
	INTEGER N
	INTEGER NERR
	INTEGER TBEGBUTT,TLENBUTT
	CHARACTER*1 C
	CHARACTER*255 CDUMMY
	CHARACTER*255 CADENA
	LOGICAL LRUN,LMANUAL
C------------------------------------------------------------------------------
	NERR=0
10	IF(CDEF.NE.'@')THEN
	  L1=TBEGBUTT(CDEF)
	  IF(L1.NE.0)THEN
	    L2=TLENBUTT(CDEF)
	    WRITE(*,'(A,A,A,$)')'[',CDEF(L1:L2),'] ? '
	  END IF
	ELSE
	  WRITE(*,100)'? '
	END IF
	READ(*,'(A)',ERR=20)CADENA
	IF(CADENA(1:7).EQ.'endplot')THEN
	  CALL PGEND
	  STOP
	END IF
	IF(TLENBUTT(CADENA).EQ.0)THEN
	  IF(CDEF.EQ.'@')THEN
	    GOTO 10
	  END IF
	  CADENA=CDEF
	END IF
	DO I=1,TLENBUTT(CADENA)
	  C=CADENA(I:I)
	  IF((INDEX('abcdefghijklmnopqrstuvwxyz',C).NE.0).OR.
     +     (INDEX('ABCDEFGHIJKLMNOPQRSTUVWXYZ./',C).NE.0))THEN
	    GOTO 20
	  END IF
	END DO
	READ(CADENA,*,ERR=20) N
	READIBUTT=N
	CALL LRUNXBUTT(LRUN,LMANUAL)
	IF(LRUN)THEN
	  WRITE(CDUMMY,*) N
	  CALL RMBLANKBUTT(CDUMMY,CDUMMY,L2)
	  WRITE(*,101) CDUMMY(1:L2)
	END IF
	IF(LMANUAL)THEN
	  WRITE(CDUMMY,*) N
	  CALL RMBLANKBUTT(CDUMMY,CDUMMY,L2)
          WRITE(*,'(A,A,A)') '\\ttshade{',CDUMMY(1:L2),'}'
	END IF
	RETURN
20	WRITE(*,101)'ERROR: invalid character(s) found in '//
     +   'number. Try again.'
	IF(CDEF.EQ.'@') WRITE(*,100)'? '
	NERR=NERR+1
	IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors.'
	GOTO 10
100	FORMAT(A,$)
101	FORMAT(A)
	END
C******************************************************************************
C return a character string
C CDEF: character string with default value
C CVAL: character string with valid characters
	CHARACTER*255 FUNCTION READCBUTT(CDEF,CVAL)
	IMPLICIT NONE
	CHARACTER*(*) CDEF,CVAL
C
	INTEGER I,L1,L2
	INTEGER TBEGBUTT,TLENBUTT
	INTEGER NERR
	CHARACTER*255 CADENA
	LOGICAL LRUN,LMANUAL
C------------------------------------------------------------------------------
	NERR=0
10	IF(CDEF.NE.'@')THEN
	  L1=TBEGBUTT(CDEF)
	  IF(L1.NE.0)THEN
	    L2=TLENBUTT(CDEF)
	    WRITE(*,'(A,A,A,$)')'[',CDEF(L1:L2),'] ? '
	  END IF
	ELSE
	  WRITE(*,100)'? '
	END IF
	READ(*,'(A)',ERR=20) CADENA
	IF(CADENA(1:7).EQ.'endplot')THEN
	  CALL PGEND
	  STOP
	END IF
	IF(CVAL.EQ.'@')THEN
	  IF(TLENBUTT(CADENA).EQ.0)THEN
	    IF(CDEF.EQ.'@')THEN
	      GOTO 10
	    END IF
	    CADENA=CDEF(L1:L2)
	  END IF
	ELSE
	  IF(TLENBUTT(CADENA).EQ.0)THEN
	    IF(CDEF.EQ.'@')THEN
	      GOTO 10
	    END IF
	    CADENA=CDEF(L1:L2)
	  ELSE
	    DO I=1,TLENBUTT(CADENA)
	      IF(INDEX(CVAL,CADENA(I:I)).EQ.0)THEN
	        WRITE(*,101)'ERROR: invalid character(s). Try again.'
		IF(CDEF.EQ.'@') WRITE(*,100)'? '
		NERR=NERR+1
		IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors.'
	        GOTO 10
	      END IF
	    END DO
	  END IF
	END IF
	READCBUTT=CADENA
	CALL LRUNXBUTT(LRUN,LMANUAL)
	IF(LRUN)THEN
	  CALL RMBLANKBUTT(CADENA,CADENA,L2)
	  WRITE(*,101)CADENA(1:L2)
	END IF
	IF(LMANUAL)THEN
	  CALL RMBLANKBUTT(CADENA,CADENA,L2)
          WRITE(*,101) '\\ttshade{'//CADENA(1:L2)//'}'
	END IF
	RETURN
20	WRITE(*,101)'ERROR: invalid entry. Try again.'
	IF(CDEF.EQ.'@') WRITE(*,100)'? '
	NERR=NERR+1
	IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors.'
	GOTO 10
100	FORMAT(A,$)
101	FORMAT(A)
	END
C******************************************************************************
C return a float number
C CDEF: character string with default value
	REAL FUNCTION READFBUTT(CDEF)
	IMPLICIT NONE
	CHARACTER*(*) CDEF
C
	INTEGER I,L1,L2
	INTEGER NERR
	REAL F
	INTEGER TBEGBUTT,TLENBUTT
	CHARACTER*1 C
	CHARACTER*255 CDUMMY
	CHARACTER*255 CADENA
	LOGICAL LRUN,LMANUAL
C------------------------------------------------------------------------------
	NERR=0
10	IF(CDEF.NE.'@')THEN
	  L1=TBEGBUTT(CDEF)
	  IF(L1.NE.0)THEN
	    L2=TLENBUTT(CDEF)
	    WRITE(*,'(A,A,A,$)')'[',CDEF(L1:L2),'] ? '
	  END IF
	ELSE
	  WRITE(*,100)'? '
	END IF
	READ(*,'(A)',ERR=20)CADENA
	IF(CADENA(1:7).EQ.'endplot')THEN
	  CALL PGEND
	  STOP
	END IF
	IF(TLENBUTT(CADENA).EQ.0)THEN
	  IF(CDEF.EQ.'@')THEN
	    GOTO 10
	  END IF
	  CADENA=CDEF
	END IF
	DO I=1,TLENBUTT(CADENA)
	  C=CADENA(I:I)
	  IF((INDEX('abcfghijklmnoprstuvwxyz',C).NE.0).OR.
     +     (INDEX('ABCFGHIJKLMNOPRSTUVWXYZ/',C).NE.0))THEN
	    GOTO 20
	  END IF
	END DO
	READ(CADENA,*,ERR=20) F
	READFBUTT=F
	CALL LRUNXBUTT(LRUN,LMANUAL)
	IF(LRUN)THEN
	  WRITE(CDUMMY,*) F
	  CALL RMBLANKBUTT(CDUMMY,CDUMMY,L2)
	  WRITE(*,101) CDUMMY(1:L2)
	END IF
	IF(LMANUAL)THEN
	  WRITE(CDUMMY,*) F
	  CALL RMBLANKBUTT(CDUMMY,CDUMMY,L2)
          WRITE(*,101) '\\ttshade{'//CDUMMY(1:L2)//'}'
	END IF
	RETURN
20	WRITE(*,101)'ERROR: invalid character(s) found in '//
     +   'number. Try again.'
	IF(CDEF.EQ.'@') WRITE(*,100)'? '
	NERR=NERR+1
	IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors.'
	GOTO 10
100	FORMAT(A,$)
101	FORMAT(A)
	END
C******************************************************************************
C determine whether files .running_RUN and .running_MANUAL exist in current
C directory
	SUBROUTINE LRUNXBUTT(LRUN,LMANUAL)
	IMPLICIT NONE
	LOGICAL LRUN,LMANUAL
	INQUIRE(FILE='.running_RUN',EXIST=LRUN)
	INQUIRE(FILE='.running_MANUAL',EXIST=LMANUAL)
	END
C******************************************************************************
C remove blanks in character string C1, returning C2 with a true length L
	SUBROUTINE RMBLANKBUTT(C1,C2,L)
	IMPLICIT NONE
	INTEGER L
	CHARACTER*(*) C1,C2
C
	INTEGER I,K
C------------------------------------------------------------------------------
	K=0
	DO I=1,LEN(C1)
	  IF(C1(I:I).NE.CHAR(32))THEN
	    K=K+1
	    C2(K:K)=C1(I:I)
	  END IF
	END DO
	L=K
	END
C******************************************************************************
