LIB = libz.a
INSTALL_LIB = libz.a
INSTALL_OTHER1 = zlib.h zconf.h
INSTALL_OTHER1_DIR = /include
LOBJ = `{ls *.c | sed 's/.$/o/'}
NPROC = $nprocs

<$mkbuild/mk.default
