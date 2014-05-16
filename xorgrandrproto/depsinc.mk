<$xorgrandrproto_DEPDIR/v.mk

xorgrandrproto_libdir = ${xorgrandrproto_DEPDIR}/randrproto-$v/lib/lib
xorgrandrproto_includedir = ${xorgrandrproto_DEPDIR}/randrproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgrandrproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
