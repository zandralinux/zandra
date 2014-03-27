BIN = smdev
OBJ = smdev.o
LIB = util.a
LOBJ = `{ls util/*.c | sed 's/.$/o/'}
INSTALL_BIN = smdev
NPROC = $nprocs

<$mkbuild/mk.common

&:n: &.o $LIB

$LIB: $LOBJ

%.h: %.def.h
	cp -f $prereq $target

smdev.o: config.h

