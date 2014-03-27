BIN = `{ls *.c | sed 's/..$//' | grep -v '^ps$'}
OBJ = ${BIN:%=%.o}
LIB = util.a
LOBJ = `{ls util/*.c | sed 's/.$/o/'}
INSTALL_BIN = `{ls *.c | sed 's/..$//' | grep -v '^ps$'}
INSTALL_MAN1 = `{ls *.1}
NPROC = $nprocs

<$mkbuild/mk.common

&:n: &.o $LIB

$LIB: $LOBJ

%.h: %.def.h
	cp -f $prereq $target

su: config.h
