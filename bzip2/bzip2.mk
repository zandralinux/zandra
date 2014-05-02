TARG = bzip2

<$mkbuild/mk.common-noinst

bzip2:QV:
	# borrowed from Crux linux.
	patch -Np1 -i ../bzip2.patch
	# make everything except doing tests.
	# NOTE: don't use DESTDIR, it's not used in the Makefile.
	make libbz2.a bzip2 bzip2recover -j$nprocs \
		CC="${CC}" AR="${AR}" RANLIB="${RANLIB}" \
		PREFIX="$prefix"
