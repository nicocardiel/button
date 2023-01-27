!------------------------------------------------------------------------------
! Version 26-November-1996                                     File: button.inc
! @ ncl & fjg
!------------------------------------------------------------------------------
! Copyright N. Cardiel & J. Gorgas, Departamento de Astrofisica
! Universidad Complutense de Madrid, 28040-Madrid, Spain
! E-mail: ncl@astrax.fis.ucm.es or fjg@astrax.fis.ucm.es
!------------------------------------------------------------------------------
! This file is free software; you can redistribute it and/or modify it
! under the terms of the GNU General Public License as published by the Free
! Software Foundation; either version 2 of the License, or (at your option) any
! later version. See the file gnu-public-license.txt for details.
!------------------------------------------------------------------------------
!------------------------------------------------------------------------------
!                      GLOBAL VARIABLES AND PARAMETERS
!------------------------------------------------------------------------------
!------------------------------------------------------------------------------
! maximum number of buttons
        INTEGER MAX_NBUTT
        PARAMETER (MAX_NBUTT=1000)
! maximum number of graphic devices that can be employed simultaneously
        INTEGER MAX_ID_BUTT
        PARAMETER (MAX_ID_BUTT=8)
!------------------------------------------------------------------------------
! maximum number of columns and rows
        INTEGER MAX_XBUTT,MAX_YBUTT
        COMMON/BUTTON1/MAX_XBUTT,MAX_YBUTT
!
! character font in buttons
        INTEGER PGSCF_BUTT
        COMMON/BUTTON2/PGSCF_BUTT
!
! font size in buttons
        REAL PGSCH_BUTT
        COMMON/BUTTON3/PGSCH_BUTT
!
! relative y-position of the text baseline in buttons
        REAL YTEXT_BUTT
        COMMON/BUTTON4/YTEXT_BUTT
!
! Plot region..: X1VPORT,X2VPORT,Y1VPORT,Y2VPORT
! Button region: X3VPORT,X4VPORT,Y3VPORT,Y4VPORT
        REAL X1VPORT,X2VPORT
        REAL X3VPORT,X4VPORT
        REAL Y1VPORT,Y2VPORT
        REAL Y3VPORT,Y4VPORT
        COMMON/BUTTON5/X1VPORT,X2VPORT,X3VPORT,X4VPORT,Y1VPORT,Y2VPORT,Y3VPORT,Y4VPORT
!
! determines whether the button exist or not
        LOGICAL EXIST_BUTT(MAX_NBUTT)
        COMMON/BUTTON6/EXIST_BUTT
!
! if .TRUE. tick marks are drawn outside the viewport instead of inside
        LOGICAL ITICKS_BUTT
        COMMON/BUTTON7/ITICKS_BUTT
!
! if .TRUE. buttons appear in text mode
        LOGICAL MODOTEXT_BUTT
! if .TRUE. buttons appear in graphic mode
        LOGICAL MODOTEXT_PLOTBUTT
        COMMON/BUTTON8/MODOTEXT_BUTT,MODOTEXT_PLOTBUTT
! if .TRUE. button numbers appear overplotted 
! (this variable is true when file .button_modoover do exist)
        LOGICAL MODOOVER_BUTT
        COMMON/BUTTON9/MODOOVER_BUTT
!------------------------------------------------------------------------------
! Miscellany
        INTEGER TRUELEN,TRUEBEG
        INTEGER READI
        REAL READF
        CHARACTER*255 READC
!------------------------------------------------------------------------------
