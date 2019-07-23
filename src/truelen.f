        INTEGER FUNCTION TRUELEN(CADENA)
        IMPLICIT NONE
        CHARACTER*(*) CADENA
C
        INTEGER I,L
C------------------------------------------------------------------------------
        TRUELEN=0
        L=LEN(CADENA)
C
        IF(L.GT.0)THEN
          DO I=L,1,-1
            IF(ICHAR(CADENA(I:I)).GT.32)THEN
              TRUELEN=I
              RETURN
            END IF
          END DO
        END IF
        END
