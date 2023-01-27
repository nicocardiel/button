        INTEGER FUNCTION READILIM(CQUESTION,CDEF,N1,N2)
        IMPLICIT NONE
        CHARACTER*(*) CQUESTION
        CHARACTER*(*) CDEF
        INTEGER N1,N2
!
        INTEGER I,L1,L2
        INTEGER N
        INTEGER NERR
        INTEGER TRUEBEG,TRUELEN
        CHARACTER*1 C
        CHARACTER*255 CDUMMY
        CHARACTER*255 CADENA
        LOGICAL LECHO
        COMMON/BLKLECHO/LECHO
!------------------------------------------------------------------------------
        IF(N2.LT.N1) STOP 'ERROR: N2.LT.N1 in function: READILIM'
        NERR=0
10      L2=TRUELEN(CQUESTION)
        IF(L2.NE.0) WRITE(*,100) CQUESTION(1:L2)
        WRITE(CDUMMY,'(A1,I10,A5,I10,A1)') '(',N1,',...,',N2,')'
        CALL RMBLANK(CDUMMY,CDUMMY,L2)
        WRITE(*,100) ' '//CDUMMY(1:L2)
        IF(CDEF.NE.'@')THEN
          L1=TRUEBEG(CDEF)
          IF(L1.NE.0)THEN
            L2=TRUELEN(CDEF)
            WRITE(*,100) ' ['
            WRITE(*,100) CDEF(L1:L2)
            WRITE(*,100) '] ? '
          END IF
        ELSE
          WRITE(*,100) '? '
        END IF
        READ(*,101,ERR=20) CADENA
        IF(TRUELEN(CADENA).EQ.0)THEN
          IF(CDEF.EQ.'@')THEN
            GOTO 10
          END IF
          CADENA=CDEF
        END IF
        DO I=1,TRUELEN(CADENA)
          C=CADENA(I:I)
          IF((INDEX('abcdefghijklmnopqrstuvwxyz',C).NE.0).OR. &
             (INDEX('ABCDEFGHIJKLMNOPQRSTUVWXYZ./',C).NE.0))THEN
            GOTO 20
          END IF
        END DO
        READ(CADENA,*,ERR=20) N
        READILIM=N
!
        IF((N.LT.N1).OR.(N.GT.N2))THEN
          WRITE(*,100) 'ERROR: invalid number. Valid range is ['
          WRITE(CDUMMY,*) N1
          CALL RMBLANK(CDUMMY,CDUMMY,L2)
          WRITE(*,100) CDUMMY(1:L2)//','
          WRITE(CDUMMY,*) N2
          CALL RMBLANK(CDUMMY,CDUMMY,L2)
          WRITE(*,101) CDUMMY(1:L2)//']. Try again.'
          NERR=NERR+1
          GOTO 22
        END IF
        IF(LECHO) WRITE(*,*) N
        RETURN
!------------------------------------------------------------------------------
20      WRITE(*,101) 'ERROR: invalid character(s) found in number. Try again.'
        NERR=NERR+1
22      IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors in READILIM.'
        GOTO 10
100     FORMAT(A,$)
101     FORMAT(A)
        END FUNCTION READILIM
