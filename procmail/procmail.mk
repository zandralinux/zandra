TARG = procmail

INSTALL_MAN1 = `{ ls man/*.1 }
INSTALL_MAN5 = `{ ls man/*.5 }
INSTALL_BIN = \
	src/formail \
	src/lockfile \
	src/mailstat \
	src/procmail \
	src/lockfile

<$mkbuild/mk.common

procmail:QV:
	# fix getline().
	sed -i 's/getline/get_line/' src/*.[ch]
	# make
	make -j$nprocs LDFLAGS="$LDFLAGS" CFLAGS="$CFLAGS"
