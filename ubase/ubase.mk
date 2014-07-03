BIN = `{ls *.c | sed 's/..$//' | grep -v '^ps$'}
OBJ = ${BIN:%=%.o}
LIB = util.a
LOBJ = `{ls util/*.c | sed 's/.$/o/'}
INSTALL_BIN = `{ls *.c | sed 's/..$//' | grep -v '^ps$'}
INSTALL_MAN1 = `{ls *.1}
INSTALL_MAN8 = `{ls *.8}
NPROC = $nprocs

<$mkbuild/mk.common

&:n: &.o $LIB

$LIB: $LOBJ

%.h: %.def.h
	cp -f $prereq $target

su: config.h
login: config.h
passwd: config.h
getty: config.h
who: config.h
uptime: config.h
