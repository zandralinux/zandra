BIN = `{ls *.c | sed 's/..$//' | grep -v '^cp$\|^tar$\|^grep$'}
OBJ = ${BIN:%=%.o}
LIB = util.a
LOBJ = `{ls util/*.c | sed 's/.$/o/'}
INSTALL_BIN = `{ls *.c | sed 's/..$//' | grep -v '^cp$\|^tar$\|^grep$'}
INSTALL_MAN1 = `{ls *.1 | grep -v '^cp\.1$\|^tar\.1$\|^grep\.1$'}
NPROC = $nprocs

<$mkbuild/mk.common

&:n: &.o $LIB

$LIB: $LOBJ
