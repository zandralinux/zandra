LIB = cares
INSTALL_LIB = lib/lib/libcares.a
INSTALL_OTHER1 = ares_build.h ares_dns.h ares.h ares_rules.h ares_version.h
INSTALL_OTHER1_DIR = /include

<$mkbuild/mk.common

cares:QV:
	export CPPFLAGS="-D_BSD_SOURCE -D_GNU_SOURCE"
	CC="${CC} -static" CFLAGS="" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-werror \
		--disable-shared \
		--enable-static
	make -j$nprocs
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
