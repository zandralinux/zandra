LIB = libz.a
LOBJ = `{ls *.c | sed 's/.$/o/'}
NPROC = 2

<$mkbuild/mk.default

