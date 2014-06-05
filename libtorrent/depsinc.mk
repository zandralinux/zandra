<$libtorrent_DEPDIR/v.mk

libtorrent_libdir = $libtorrent_DEPDIR/libtorrent-$v/lib/lib
libtorrent_includedir = $libtorrent_DEPDIR/libtorrent-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${libtorrent_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libtorrent_libdir} -ltorrent
