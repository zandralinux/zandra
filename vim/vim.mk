TARG = vim
DEPS = ncurses

<$mkbuild/mk.common-noinst

$TARG:QV:
	export CPPFLAGS="$DEPS_CFLAGS $CFLAGS" LDFLAGS="$DEPS_LDFLAGS $LDFLAGS"
	./configure --prefix=$PREFIX/ \
		--enable-multibyte --disable-gui --with-x=no \
		--disable-nls --disable-netbeans --without-local-dir
	make -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install
