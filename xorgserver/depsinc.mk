<$xorgserver_DEPDIR/v.mk

xorgserver_libdir = ${xorgserver_DEPDIR}/xorg-server-$v/lib/lib
xorgserver_includedir = ${xorgserver_DEPDIR}/xorg-server-$v/lib/include/xorg

xorgserver_CFLAGS = -I${xorgserver_includedir}
xorgserver_LDFLAGS = -L${xorgserver_libdir}

DEPS_CFLAGS = $DEPS_CFLAGS ${xorgserver_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${xorgserver_LDFLAGS}
