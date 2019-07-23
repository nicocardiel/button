        INTEGER FUNCTION TRUEBEG(CADENA)
        IMPLICIT NONE
        CHARACTER*(*) CADENA
C
        INTEGER I,L
C------------------------------------------------------------------------------
        TRUEBEG=0
        L=LEN(CADENA)
C
        IF(L.GT.0)THEN
          DO I=1,L
            IF(ICHAR(CADENA(I:I)).GT.32)THEN
              TRUEBEG=I
              RETURN
            END IF
          END DO
        END IF
        END
