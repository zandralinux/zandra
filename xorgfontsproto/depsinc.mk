<$xorgfontsproto_DEPDIR/v.mk

xorgfontsproto_libdir = ${xorgfontsproto_DEPDIR}/fontsproto-$v/lib/lib
xorgfontsproto_includedir = ${xorgfontsproto_DEPDIR}/fontsproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgfontsproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
