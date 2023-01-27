        INTEGER FUNCTION TRUEBEG(CADENA)
        IMPLICIT NONE
        CHARACTER*(*) CADENA
!
        INTEGER I,L
!------------------------------------------------------------------------------
        TRUEBEG=0
        L=LEN(CADENA)
!
        IF(L.GT.0)THEN
          DO I=1,L
            IF(ICHAR(CADENA(I:I)).GT.32)THEN
              TRUEBEG=I
              RETURN
            END IF
          END DO
        END IF
        END FUNCTION TRUEBEG
