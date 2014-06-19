TARG = vim
DEPS = ncurses

<$mkbuild/mk.common-noinst

$TARG:QV:
	export CPPFLAGS="$DEPS_CFLAGS $CFLAGS"
	export LDFLAGS="$DEPS_LDFLAGS $LDFLAGS"
	./configure \
		--prefix="$PREFIX/" \
		--disable-gui \
		--disable-nls \
		--disable-netbeans \
		--without-local-dir \
		--with-x=no \
		--enable-multibyte
	make -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install
	$INSTALL -d -m 755 $ROOT/$BINDIR
	ln -sf vim $ROOT/$BINDIR/vi
