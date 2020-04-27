TARG = binutils

<$mkbuild/mk.common-noinst

binutils:QV:
	./configure \
		--prefix="$PREFIX" \
		--disable-multilib \
		--disable-nls \
		--disable-gold \
		--disable-werror \
		--build=x86_64-linux-musl \
		--target=x86_64-linux-musl
	make -j$nprocs
	cd binutils
	rm bfdtest1 bfdtest2 ar addr2line cxxfilt elfedit nm-new \
		objcopy objdump ranlib readelf size strings strip-new
	make LDFLAGS="-all-static" -j$nprocs
	cd ../gas
	rm as-new
	make LDFLAGS="-all-static" -j$nprocs
	cd ../ld
	rm ld-new
	make LDFLAGS="-all-static" -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install
