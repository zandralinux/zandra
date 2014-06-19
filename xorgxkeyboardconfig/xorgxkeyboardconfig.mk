# runtime deps: xorgxkbcomp
# make deps: intltool, XML::Parser (p5-xml-parser perl module).
TARG = xorgxkeyboardconfig

<$mkbuild/mk.common-noinst

$TARG:QV:
	CC="$CC -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls \
		--disable-runtime-deps \
		--with-xkb-base="$PREFIX/share/X11/xkb" \
		--with-xkb-rules-symlink=xorg \
		--enable-static
	for i in po ; do
		printf 'all:\n\ttrue\ninstall:\n\ttrue\nclean:\n\ttrue\n' > "$i"/Makefile
	done
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
