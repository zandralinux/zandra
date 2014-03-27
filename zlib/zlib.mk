LIB = libz.a
LOBJ = `{ls *.c | sed 's/.$/o/'}
NPROC = $nprocs

<$mkbuild/mk.default

