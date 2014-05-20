<$xorgserver_DEPDIR/v.mk

xorgserver_libdir = $xorgserver_DEPDIR/xorg-server-$v/lib/lib
xorgserver_includedir = $xorgserver_DEPDIR/xorg-server-$v/lib/include/xorg
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgserver_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorgserver_libdir}
