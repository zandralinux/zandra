TARG = testdisk
DEPS = ncurses e2fsprogs ntfs3g

<$mkbuild/mk.common-noinst

testdisk:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-qt \
		--without-iconv \
		--without-reiserfs \
		--without-ewf \
		--without-jpeg \
		--without-ntfs \
		--with-ext2fs-lib="${e2fsprogs_libdir}" \
		--with-ext2fs-includes="${e2fsprogs_includedir}" \
		--with-ntfs3g-lib="${ntfs3g_libdir}" \
		--with-ntfs3g-includes="${ntfs3g_includedir}" \
		--with-ncurses-lib="${ncurses_libdir}" \
		--with-ncurses-includes="${ncurses_includedir}"
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
