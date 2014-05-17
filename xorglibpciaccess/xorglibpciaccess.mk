TARG = xorglibpciaccess
DEPS = zlib

<$mkbuild/mk.common-noinst

xorglibpciaccess:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# fix missing include for limits.h (PATH_MAX).
	patch --silent --dry-run -N -p0 < ../limits.patch && \
		patch -p0 < ../limits.patch
	CC="$CC" ./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--with-zlib \
		--disable-shared \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
