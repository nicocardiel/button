        CHARACTER*(*) FUNCTION READC(CQUESTION,CDEF,CVAL)
        IMPLICIT NONE
        CHARACTER*(*) CQUESTION
        CHARACTER*(*) CDEF
        CHARACTER*(*) CVAL
!
        INTEGER I,L1,L2
        INTEGER TRUEBEG,TRUELEN
        INTEGER NERR
        CHARACTER*255 CADENA
        LOGICAL LECHO
        COMMON/BLKLECHO/LECHO
!------------------------------------------------------------------------------
        L1=0 !evita un WARNING de compilación
        NERR=0
10      L2=TRUELEN(CQUESTION)
        IF(L2.NE.0) WRITE(*,100) CQUESTION(1:L2)
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
        IF(CVAL.EQ.'@')THEN
          IF(TRUELEN(CADENA).EQ.0)THEN
            IF(CDEF.EQ.'@')THEN
              GOTO 10
            END IF
            CADENA=CDEF(L1:L2)
          END IF
        ELSE
          IF(TRUELEN(CADENA).EQ.0)THEN
            IF(CDEF.EQ.'@')THEN
              GOTO 10
            END IF
            CADENA=CDEF(L1:L2)
          ELSE
            DO I=1,TRUELEN(CADENA)
              IF(INDEX(CVAL,CADENA(I:I)).EQ.0)THEN
                WRITE(*,101) 'ERROR: invalid character(s). Try again.'
                NERR=NERR+1
                IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors in READC.'
                GOTO 10
              END IF
            END DO
          END IF
        END IF
        READC=CADENA
        IF(LECHO) WRITE(*,101) CADENA(1:TRUELEN(CADENA))
        RETURN
20      WRITE(*,101) 'ERROR: invalid character(s). Try again.'
        NERR=NERR+1
        IF(NERR.GT.10) STOP 'FATAL ERROR: too many errors in READC.'
        GOTO 10
100     FORMAT(A,$)
101     FORMAT(A)
        END FUNCTION READC
