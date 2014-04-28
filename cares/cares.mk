TARG = cares

<$mkbuild/mk.common-noinst

cares:QV:
	export CPPFLAGS="-D_BSD_SOURCE -D_GNU_SOURCE"
	CC="${CC} -static" CFLAGS="" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
		--disable-werror \
		--disable-shared \
		--enable-static
	make -j$nprocs
