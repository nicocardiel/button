!------------------------------------------------------------------------------
! Version 20-January-1998                                      File: ifbutton.f
!------------------------------------------------------------------------------
! Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
! Universidad Complutense de Madrid, 28040-Madrid, Spain
! E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
!------------------------------------------------------------------------------
! This routine is free software; you can redistribute it and/or modify it
! under the terms of the GNU General Public License as published by the Free
! Software Foundation; either version 2 of the License, or (at your option) any
! later version. See the file gnu-public-license.txt for details.
!------------------------------------------------------------------------------
!omment
!
! SUBROUTINE IFBUTTON(XC,YC,NB)
!
! Input: XC,YC
! Output: NB
!
! Determine whether any button has been selected.
!
! REAL    XC -> world x-coordinate of the cursor
! REAL    YC -> world y-coordinate of the cursor
! INTEGER NB -> number of the selected button (if available). NB=0 if no
!               button has been selected.
!
!omment
!------------------------------------------------------------------------------
!
        SUBROUTINE IFBUTTON(XC,YC,NB)
        IMPLICIT NONE
        REAL XC,YC
        INTEGER NB
!
! Determina si un boton ha sido pulsado o no. Si el boton ha sido
! pulsado NB= numero del boton. En caso contrario, NB=0.
! El numero de boton se corresponde con el numero de cuadricula
! dentro del grid definido por MAX_XBUTT y MAX_YBUTT
!------------------------------------------------------------------------------
        INCLUDE 'button.inc'
!------------------------------------------------------------------------------
! Variables locales
        INTEGER I
        INTEGER NLIN,NCOL
        REAL X1W,X2W,Y1W,Y2W
        REAL X1V,X2V,Y1V,Y2V
        REAL ESCX,ESCY
        REAL X1,X2,Y1,Y2
        REAL XX1,XX2,YY1,YY2
        REAL NX1,NX2,NY1,NY2
        REAL DX,DY
!------------------------------------------------------------------------------
!------------------------------------------------------------------------------
        IF(MODOTEXT_BUTT)THEN
          NB=READI('Button number','0')
          IF(NB.EQ.0) RETURN
          IF((NB.LT.1).OR.(NB.GT.MAX_XBUTT*MAX_YBUTT))THEN
            WRITE(*,101)'ERROR: number out of range.'
            WRITE(*,101)'=> returned NB=0'
            NB=0
            RETURN
          END IF
          IF(.NOT.EXIST_BUTT(NB))THEN
            WRITE(*,101)'ERROR: this button is not active.'
            NB=0
          END IF
          RETURN
        END IF
!------------------------------------------------------------------------------
        CALL PGQWIN(X1W,X2W,Y1W,Y2W)
        CALL PGQVP(0,X1V,X2V,Y1V,Y2V)
        ESCX=(X2W-X1W)/(X2V-X1V)
        ESCY=(Y2W-Y1W)/(Y2V-Y1V)
!
        DX=X4VPORT-X3VPORT
        DY=Y4VPORT-Y3VPORT
!
        DO I=1,MAX_XBUTT*MAX_YBUTT                !recorremos todos los botones
          IF(EXIST_BUTT(I))THEN                        !si el boton esta activo
            NLIN=(I-1)/MAX_XBUTT+1
            NCOL=I-(NLIN-1)*MAX_XBUTT
            X1=X3VPORT+REAL(NCOL-1)*DX/REAL(MAX_XBUTT)
            X2=X1+DX/REAL(MAX_XBUTT)
            Y2=Y4VPORT-REAL(NLIN-1)*DY/REAL(MAX_YBUTT)
            Y1=Y2-DY/REAL(MAX_YBUTT)
            NX1=X1W+(X1-X1V)*ESCX
            NX2=X1W+(X2-X1V)*ESCX
            NY1=Y1W+(Y1-Y1V)*ESCY
            NY2=Y1W+(Y2-Y1V)*ESCY
            XX1=AMIN1(NX1,NX2)
            XX2=AMAX1(NX1,NX2)
            YY1=AMIN1(NY1,NY2)
            YY2=AMAX1(NY1,NY2)
            IF((XX1.LE.XC).AND.(XX2.GE.XC).AND.(YY1.LE.YC).AND.(YY2.GE.YC))THEN
              NB=I
              RETURN
            END IF
          END IF
        END DO
!
        NB=0                                  !no se ha encontrado ningun boton
!------------------------------------------------------------------------------
101     FORMAT(A)
        END SUBROUTINE IFBUTTON
