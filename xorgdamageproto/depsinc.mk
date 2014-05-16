<$xorgdamageproto_DEPDIR/v.mk

xorgdamageproto_libdir = ${xorgdamageproto_DEPDIR}/damageproto-$v/lib/lib
xorgdamageproto_includedir = ${xorgdamageproto_DEPDIR}/damageproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgdamageproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
