#!/bin/sh

# compile the application using gambit scheme. It is straightforward to
# modify the script to handle whichever flavor of scheme you wish to use.

cat gambit-optimize.scm \
  src/random.scm src/sort.scm src/library.scm \
  src/string.scm \
  src/print.scm \
  src/primitives.scm src/movetables.scm src/chessmoveroutines.scm \
  src/sch-specific.scm src/book.scm src/btree.scm \
  src/engine.scm src/examples.scm src/app.scm src/run.scm \
  > x.scm
gsc -c x.scm
gsc -link x.scm
gcc \
  -O1 \
  -D___SINGLE_HOST \
  -m32 \
  -I/Library/Gambit-C/v4.6.1/include \
  -L/Library/Gambit-C/v4.6.1/lib \
  -lgambc -lm x.c x_.c
mv a.out x # executable in x
