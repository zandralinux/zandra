TARG = alsalib

<$mkbuild/mk.common-noinst

alsalib:QV:
	# disable tests.
	printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > test/Makefile.in
	#
	rm -f src/compat/hsearch_r.c
	touch src/compat/hsearch_r.c
	sed -i 's,#if !defined(_POSIX_C_SOURCE) && !defined(_POSIX_SOURCE),#if 0,' include/global.h
	#
	CC="$CC -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-python \
		--disable-old-symbols \
		--without-versioned \
		--disable-aload \
		--disable-alisp \
		--enable-static
	# install lib for use as a dependency.
	make -j$nprocs install \
		V="1" LDFLAGS="-all-static $LDFLAGS" DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install \
		V="1" LDFLAGS="-all-static $LDFLAGS" DESTDIR="$ROOT"
