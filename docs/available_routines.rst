Classified list of routines
===========================

Modified PGPLOT routines
------------------------

* ``RPGBAND``: similar to PGBAND, with the same arguments
* ``RPGBEGIN``: similar to PGBEGIN, with different arguments
* ``RPGBEGOK``: similar to PGBEGIN, with with only one argument
* ``RPGERAS``: clear the plot region
* ``RPGERASB``: clear the button region
* ``RPGERASW``: clear any region

Button handling
---------------

* ``BUTTON``: plot buttons and button text in different modes
* ``IFBUTTON``: determine whether any button has been selected

Establish button settings
-------------------------

* ``BUTTSBR``: set the button region limits
* ``BUTTSCF``: set the character font type in buttons
* ``BUTTSCH``: set the character height in buttons
* ``BUTTSEX``: set whether the asked button is active (currently available) or not
* ``BUTTSIT``: set whether tick marks are drawn outside the plot instead of inside
* ``BUTTSPR``: set the plot region limits
* ``BUTTSXB``: set MAX_XBUTT
* ``BUTTSYB``: set MAX_YBUTT
* ``BUTTSYTEXT``: set the relative y-position of the text baseline in buttons

Query button settings
---------------------

* ``BUTTQBR``: query the button region limits
* ``BUTTQCF``: query the character font type in buttons
* ``BUTTQCH``: query the character height in buttons
* ``BUTTQEX``: query whether the asked button is active (currently available) or not
* ``BUTTQIT``: query whether tick marks are drawn outside the plot instead of inside
* ``BUTTQPR``: query the plot region limits
* ``BUTTQXB``: query MAX_XBUTT
* ``BUTTQYB``: query MAX_YBUTT
* ``BUTTQYTEXT``: query the relative y-position of the text baseline in buttons

