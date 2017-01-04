Installation
============

Requirements
------------

Before you install BUTTON, make sure that PGPLOT (version 5.1.0 or above) is
already installed in your system. If this is not the case, you can download
PGPLOT from `here <http://www.astro.caltech.edu/~tjp/pgplot/>`_.

Some details about how I do typically install PGPLOT under ``Linux`` and ``Mac
OS X`` are given `here <https://guaix.fis.ucm.es/~ncl/howto/howto-pgplot>`_.

**button** Installation
-----------------------

To install **button** you need to perform the following steps:


1.- Download the latest distribution from github:

::

    $ git clone https://github.com/nicocardiel/button

2.- Enter into the directory ``button`` and prepare the code to be compiled

::

   $ autoreconf -s -i -f
   $ ./configure

.. note:: Mac users can easily indicate a different Fortran compiler using
      ``./configure F77=gfortran-mp-5``.

3.- Compile the code:

::

   $ make
