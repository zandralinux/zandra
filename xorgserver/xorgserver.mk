TARG = xorgserver

<$mkbuild/mk.common-noinst

xorgserver:QV:
    ./configure --prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--localstatedir=/var \
		--with-fontrootdir=/usr/share/fonts/X11 \
		--with-xkb-output=/var/lib/xkb \
		--disable-shared \
		--enable-xfbdev \
		--enable-kdrive \
		--enable-kdrive-kbd \
		--enable-kdrive-mouse \
		--enable-kdrive-evdev=no \
		--disable-dri \
		--with-sha1=libcrypto \
		--disable-config-dbus \
		--enable-static
	make -j$nprocs
#    rmdir $PKG/var/log
#	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
#	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
#	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man"
#	make -j$nprocs

install:QV:
	false
#    make DESTDIR=$PKG install
#    mkdir -p /etc/X11/xorg.conf.d
#    install -m 755 -d $PKG/etc/X11/xorg.conf.d
