# openssl is used for --with-sha1=libcrypto
TARG = xorgserver
DEPS = xorglibpixman xorglibx11 openssl xorglibpciaccess \
	xorgprotoall xorglibxau xorglibxkbfile \
	xorgxtrans xorglibxfont freetype xorglibfontenc libpng zlib

<$mkbuild/mk.common-noinst

xorgserver:QV:
	# fix termio.h -> termios.h
	sed 's@termio.h@termios.h@g' -i 'hw/xfree86/os-support/xf86_OSlib.h'
	# fix __uid_t and __gid_t
	sed 's@__uid_t@uid_t@g' -i 'hw/kdrive/linux/linux.c'
	sed 's@__gid_t@gid_t@g' -i 'hw/kdrive/linux/linux.c'
	# don't build tests.
	printf "all:\n\ttrue\ninstall:\n\ttrue\n" > test/Makefile.in
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export CPPFLAGS="$CFLAGS"
	export PCIACCESS_CFLAGS="-I${xorglibpciaccess_includedir}"
	export PCIACCESS_LIBS="-L${xorglibpciaccess_libdir} -lpciaccess"
	export PIXMAN_CFLAGS="-I${xorglibpixman_includedir}"
	export PIXMAN_LIBS="-L${xorglibpixman_libdir} -lz -m -lpng -lpixman-1"
	export XLIB_CFLAGS="-I${xorglibx11_includedir}"
	export XLIB_LIBS="-L${xorglibx11_libdir} -lX11"
	export XSERVERCFLAGS_CFLAGS="${CFLAGS}"
	export XSERVERCFLAGS_LIBS="${LDFLAGS}"
	export XSERVERLIBS_CFLAGS="${CFLAGS}"
	export XSERVERLIBS_LIBS="${LDFLAGS}"
	export XORG_MODULES_CFLAGS="${CFLAGS}"
	export XORG_MODULES_LIBS="${LDFLAGS}"
	export DGA_CFLAGS="-I${xorgxf86dgaproto_includedir}"
	export DGA_LIBS="-L${xorgxf86dgaproto_libdir}"
	# TODO: make able to run server rootless or setuid binary?
	export CC="$CC -static"
	# NOTE: xorgvideofbdev requires --enable-dga.
	# NOTE: kdrive-kbd seems broken(?).
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/$PREFIX/share/man" \
		--localstatedir=/var \
		--with-fontrootdir="$PREFIX/share/fonts/X11" \
		--with-xkb-output="/var/lib/xkb" \
		--disable-dri \
		--disable-dri2 \
		--disable-aiglx \
		--disable-glx-tls \
		--disable-glx \
		--disable-config-dbus \
		--disable-config-hal \
		--disable-shared \
		--disable-kdrive-kbd \
		--enable-static \
		--enable-dga \
		--enable-xfbdev \
		--enable-kdrive \
		--enable-kdrive-evdev \
		--enable-kdrive-mouse \
		--with-sha1=libcrypto
	# NOTE: "-all-static" is needed.
	make -j$nprocs LDFLAGS="-all-static $LDFLAGS"
	# install include files for dependency aswell (xorg-server-devel).
	make -j$nprocs install LDFLAGS="-all-static $LDFLAGS" DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find "`pwd`/lib" -iname "*.la" -exec rm {} \;

install:QV:
	# NOTE: "-all-static" is needed.
	make -j$nprocs install DESTDIR="$ROOT" LDFLAGS="-all-static $LDFLAGS"
	$INSTALL -m 755 -d "$ROOT/etc/X11/xorg.conf.d"
