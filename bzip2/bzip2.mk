TARG = bzip2
INSTALL_BIN = bzip2 bzip2recover bzgrep bzmore bzdiff
INSTALL_MAN1 = `ls -1 *.1`

<$mkbuild/mk.common

bzip2:QV:
	# borrowed from Crux linux.
	patch --silent --dry-run -N -p1 < ../bzip2.patch && \
		patch -Np1 < ../bzip2.patch
	# make everything except doing tests.
	# NOTE: don't use DESTDIR, it's not used in the Makefile.
	make libbz2.a bzip2 bzip2recover -j$nprocs \
		CC="${CC} -static" LDFLAGS="$LDFLAGS" AR="${AR}" \
		RANLIB="${RANLIB}" PREFIX="$prefix"
