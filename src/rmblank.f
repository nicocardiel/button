        SUBROUTINE RMBLANK(C1,C2,L)
        IMPLICIT NONE
        INTEGER L
        CHARACTER*(*) C1,C2
C
        INTEGER I,K,L0
C------------------------------------------------------------------------------
        K=0
        L0=LEN(C1)
        DO I=1,L0
          IF(C1(I:I).NE.CHAR(32))THEN
            K=K+1
            C2(K:K)=C1(I:I)
          END IF
        END DO
        L=K
        L0=LEN(C2)
        IF(L.LT.L0)THEN
          DO I=L+1,L0
            C2(I:I)=' '
          END DO
        END IF
        END
