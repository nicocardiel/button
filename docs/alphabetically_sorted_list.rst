Alphabetically sorted list
==========================

``buttmis``
-----------

::

   BUTTMIS
   This file contains subroutines and functions which are similar to other
   already defined for REDUCEME, namely TRUELEN, TRUEBEG, READI, READC, READF,
   LRUNX and RMBLANK. We duplicate them in order to create a library which must
   work independtly of REDUCEME.
   
   INTEGER FUNCTION TLENBUTT(CADENA)
   INTEGER FUNCTION TBEGBUTT(CADENA)
   INTEGER FUNCTION READIBUTT(CDEF)
   CHARACTER*(*) FUNCTION READCBUTT(CDEF,CVAL)
   REAL FUNCTION READFBUTT(CDEF)
   SUBROUTINE LRUNXBUTT(LRUN,LMANUAL)
   SUBROUTINE RMBLANKBUTT(C1,C2,L)

``button``
----------

::

   SUBROUTINE BUTTON(N,TEXT,MODE)
   Input: N,TEXT,MODE
   Input (COMMON): global variables in button.inc
   
   Plot buttons and button text in different modes.
   
   INTEGER       N -> button number in the range of available buttons (which
                 runs from 1 to MAX_XBUTT x MAX_YBUTT)
   CHARACTER*(*) TEXT -> the text that will appear in the button
   INTEGER       MODE -> determine the button mode:
                 MODE=-2,-3,...: only text is plotted with PGPLOT color=-NMODE-1
                 (i.e. 1,2,3...)
                 MODE=-1 erase the button
                 MODE=0 whole button is plotted (text in black)
                 MODE=1 only text is plotted (white)
                 MODE=2 only text is plotted (black)
                 MODE=3 only text is plotted (gray, button disabled)
                 MODE=4 whole button with reversed colors (text in black)
                 MODE=5 whole button with reversed colors (text in white)

``buttqbr``
------------

::

   SUBROUTINE BUTTQBR(X1,X2,Y1,Y2)
   Output: X1,X2,Y1,Y2
   
   Return the button region limits.
   
   REAL X1 -> x-coordinate of the left hand edge of the button region viewport,
        in normalized device coordinates
   REAL X2 -> x-coordinate of the right hand edge of the button region viewport,
        in normalized device coordinates
   REAL Y1 -> y-coordinate of the bottom edge of the button region viewport,
        in normalized device coordinates
   REAL Y2 -> y-coordinate of the top edge of the button region viewport,
        in normalized device coordinates

``buttqcf``
-----------

::
   
   SUBROUTINE BUTTQCF(FONT)
   Output: FONT
   
   Return the current character font type in buttons.
   
   INTEGER FONT -> the current font number (in range 1-4)

``buttqch``
-----------

::

   SUBROUTINE BUTTQCH(SIZE)
   Output: SIZE
   
   Return the current character font size in buttons.
   
   REAL SIZE -> the current font size (dimensionless multiple of the default
           size)

``buttqex``
-----------

::

   SUBROUTINE BUTTQEX(NBUT,LEXIST)
   Input: NBUT
   Output: LEXIST
   
   Return whether the asked button is active (currently available) or not.
   
   INTEGER NBUT -> button number
   LOGICAL LEXIST -> .TRUE. if the button is active, .FALSE. otherwise

``buttqit``
-----------

::

   SUBROUTINE BUTTQIT(LOUTSIDE)
   Output: LOUTSIDE
   
   Return whether tick marks are drawn outside the viewport instead of inside.
   
   LOGICAL LOUTSIDE -> .TRUE. if ticks are drawn outside the viewport

``buttqpr``
-----------

::

   SUBROUTINE BUTTQPR(X1,X2,Y1,Y2)
   Output: X1,X2,Y1,Y2
   
   Return the plot region limits.
   
   REAL X1 -> x-coordinate of the left hand edge of the plot region viewport,
        in normalized device coordinates
   REAL X2 -> x-coordinate of the right hand edge of the plot region viewport,
        in normalized device coordinates
   REAL Y1 -> y-coordinate of the bottom edge of the plot region viewport,
        in normalized device coordinates
   REAL Y2 -> y-coordinate of the top edge of the plot region viewport,
        in normalized device coordinates

``buttqxb``
-----------

::

   SUBROUTINE BUTTQXB(NB)
   Output: NB
   
   Return MAX_XBUTT.
   
   INTEGER NB -> = MAX_XBUTT

``buttqyb``
-----------

::

   SUBROUTINE BUTTQYB(NB)
   Output: NB
   
   Return MAX_YBUTT.
   
   INTEGER NB -> = MAX_YBUTT

``buttqytext``
--------------

::

   SUBROUTINE BUTTQYTEXT(YTEXT)
   Output: YTEXT
   
   Return the current relative y-position of the text baseline in buttons
   (from 0 to 1)
   
   REAL YTEXT -> = YTEXT_BUTT
 
``buttsbr``
-----------

::

   SUBROUTINE BUTTSBR(X1,X2,Y1,Y2)
   Input: X1,X2,Y1,Y2
   
   Set the button region limits.
   
   REAL X1 -> x-coordinate of the left hand edge of the button region viewport,
        in normalized device coordinates
   REAL X2 -> x-coordinate of the right hand edge of the button region viewport,
        in normalized device coordinates
   REAL Y1 -> y-coordinate of the bottom edge of the button region viewport,
        in normalized device coordinates
   REAL Y2 -> y-coordinate of the top edge of the button region viewport,
        in normalized device coordinates

``buttscf``
-----------

::

   SUBROUTINE BUTTSCF(FONT)
   Input : FONT
   
   Set the character font type in buttons.
   
   INTEGER FONT -> the current font number (in range 1-4)

``buttsch``
-----------

::

   SUBROUTINE BUTTSCH(SIZE)
   Input: SIZE
   
   Set the character height in buttons.
   
   REAL SIZE -> the current font size (dimensionless multiple of the default
        size)

``buttsex``
-----------

::

   SUBROUTINE BUTTSEX(NBUT,LEXIST)
   Input: NBUT,LEXIST
   
   Set whether the asked button is active (currently available) or not.
   
   INTEGER NBUT -> button number
   LOGICAL LEXIST -> .TRUE. if the button is active, .FALSE. otherwise

``buttsit``
-----------

::

   SUBROUTINE BUTTSIT(LOUTSIDE)
   Input: LOUTSIDE
   
   Set whether tick marks are drawn outside the viewport instead of inside.
   
   LOGICAL LOUTSIDE -> .TRUE. if ticks are drawn outside the viewport

``buttspr``
-----------

::

   SUBROUTINE BUTTSPR(X1,X2,Y1,Y2)
   Input: X1,X2,Y1,Y2
   
   Set the plot region limits.
   
   REAL X1 -> x-coordinate of the left hand edge of the plot region viewport,
        in normalized device coordinates
   REAL X2 -> x-coordinate of the right hand edge of the plot region viewport,
        in normalized device coordinates
   REAL Y1 -> y-coordinate of the bottom edge of the plot region viewport,
        in normalized device coordinates
   REAL Y2 -> y-coordinate of the top edge of the plot region viewport,
        in normalized device coordinates
   
``buttsxb``
-----------

::

   SUBROUTINE BUTTSXB(NB)
   Input: NB
   
   Set MAX_XBUTT.
   
   INTEGER NB -> = MAX_XBUTT

``buttsyb``
-----------

::

   SUBROUTINE BUTTSYB(NB)
   Input: NB
   
   Set MAX_YBUTT.
   
   INTEGER NB -> = MAX_YBUTT
   
``buttsytext``
--------------

::
   
   SUBROUTINE BUTTSYTEXT(YTEXT)
   Input: YTEXT
   
   Set the relative y-position of the text baseline in buttons (from 0 to 1)
   
   REAL YTEXT -> = YTEXT_BUTT

``ifbutton``
------------

::
   
   SUBROUTINE IFBUTTON(XC,YC,NB)
   Input: XC,YC
   Output: NB
   
   Determine whether any button has been selected.
      
   REAL    XC -> world x-coordinate of the cursor
   REAL    YC -> world y-coordinate of the cursor
   INTEGER NB -> number of the selected button (if available). NB=0 if no
                 button has been selected.
   
``rpgband``
-----------

::

   SUBROUTINE RPGBAND(MODE,POSN,XREF,YREF,XC,YC,CH)
   Input: MODE,POSN,XREF,YREF
   Output: XC,YC,CH
      
   This routine is similar to PGBAND, but it also allows the utilization of
   buttons in text mode.
   
   INTEGER     MODE -> display mode (see PGPLOT manual)
   INTEGER     POSN -> if POSN=1, the routine positions the cursor at the
               position specified by XREF,YREF
   REAL        XREF -> reference position
   REAL        YREF -> reference position
   REAL        XC -> the world x-coordinate of the cursor
   REAL        YC -> the world y-coordinate of the cursor
   CHARACTER*1 CH -> the character typed by the user
   
``rpgbegin``
------------

::
   
   SUBROUTINE RPGBEGIN(NTERM,IDN,LCOLOR)
   Output: NTERM,IDN,LCOLOR
   Output (COMMON): all global variables in button.inc
   
   Open the graphic device(s) and assign the default values to the global
   variables:
   MAX_XBUTT=6
   MAX_YBUTT=2
   PGSCF_BUTT=2
   PGSCH_BUTT=1.
   YTEXT_BUTT=0.35
   X1VPORT=0.1
   X2VPORT=0.95
   Y1VPORT=0.1
   Y2VPORT=0.70
   X3VPORT=0.05
   X4VPORT=0.95
   Y3VPORT=0.80
   Y4VPORT=0.95
   
   INTEGER NTERM -> number of opened graphic devices to be employed
           simultaneously
   INTEGER IDN(8) -> identifier of the openned graphic devices
           (positive values returned by PGOPEN)
   LOGICAL LCOLOR(8) -> determines whether color is available or not
           in each opened graphic device

``rpgbegok``
------------

::
   
   SUBROUTINE RPGBEGOK(TTERM)
   Output (COMMON): all global variables in button.inc
   
   Open the graphic device TTERM and assign the default values to the global
   variables:
   MAX_XBUTT=6
   MAX_YBUTT=2
   PGSCF_BUTT=2
   PGSCH_BUTT=1.
   YTEXT_BUTT=0.35
   X1VPORT=0.1
   X2VPORT=0.95
   Y1VPORT=0.1
   Y2VPORT=0.70
   X3VPORT=0.05
   X4VPORT=0.95
   Y3VPORT=0.80
   Y4VPORT=0.95
   
   CHARACTER*(*) TTERM -> graphic device to be opened

``rpgenv``
----------

::
   
   SUBROUTINE RPGENV(XMIN,XMAX,YMIN,YMAX,JUST,AXIS)
   Input: XMIN,XMAX,YMIN,YMAX,JUST,AXIS
   Input (COMMON): ITICKS_BUTT
   
   Perform the same functions than PGENV, although the plot surface is
   restricted to the rectangle defined by X1VPORT,X2VPORT,Y1VPORT,Y2VPORT.
   Other important difference with PGENV is that RPGENV does not clear the
   plot region of the new plot. A previous call to PGADVANCE, PGPAGE, PGERAS
   (RPGERAS, RPGERASB or RPGERASW) is required. The arguments of this routine
   are exactly the same than those in PGENV:
   
   REAL    XMIN -> the world x-coordinate at the bottom left corner of the
                   viewport
   REAL    XMAX -> the world x-coordinate at the top right corner of the
                   viewport
   REAL    YMIN -> the world y-coordinate at the bottom left corner of the
                   viewport
   REAL    YMAX -> the world y-coordinate at the top right corner of the
                   viewport
   INTEGER JUST -> if JUST=1, the scales of the x and y axes (in world
                   coordinates per inch) will be equal, otherwise they will be
                   scaled independently
   INTEGER AXIS -> controls the plotting of axes, tick marks, etc:
           AXIS = -2: draw no box, axes or labels
           AXIS = -1: draw box only
           AXIS =  0: draw box and label it with coordinates
           AXIS =  1: same as AXIS=0, but also draw the coordinate axes
           AXIS =  2: same as AXIS=1, but also draw grid lines
           AXIS = 10: draw box and label X-axis logarithmically
           AXIS = 20: draw box and label Y-axis logarithmically
           AXIS = 30: draw box and label both axes logarithmically
   
``rpgeras``
-----------

::
   
   SUBROUTINE RPGERAS
   Input (COMMON) : X1VPORT,X2VPORT,Y1VPORT,Y2VPORT
   
   Clear the plot region (preserving the button region which does not overlap
   with the plot region).
   
``rpgerasb``
------------

::
   
   SUBROUTINE RPGERASB
   Input (COMMON) : X3VPORT,X4VPORT,Y3VPORT,Y4VPORT
   
   Clear the button region (preserving the plot region which does not overlap
   with the plot region).
   
``rpgerasw``
------------

::
   
   SUBROUTINE RPGERASW(X1,X2,Y1,Y2)
   Input: X1,X2,Y1,Y2
   
   Clear any rectangle defined by (X1,Y1) lower left corner
                                  (X2,Y2) upper right corner
   
   REAL X1 -> x-coordinate of the left hand edge of the rectangle to be
              cleared,in normalized device coordinates
   REAL X2 -> x-coordinate of the right hand edge of the rectangle to be
              cleared,in normalized device coordinates
   REAL Y1 -> y-coordinate of the bottom edge of the rectangle to be
              cleared,in normalized device coordinates
   REAL Y2 -> y-coordinate of the top edge of the rectangle to be
              cleared,in normalized device coordinates
   
   NOTE: this subroutine preserves the original viewport and window coordinate
         systems
