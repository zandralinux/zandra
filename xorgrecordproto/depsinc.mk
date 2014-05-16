<$xorgrecordproto_DEPDIR/v.mk

xorgrecordproto_libdir = ${xorgrecordproto_DEPDIR}/recordproto-$v/lib/lib
xorgrecordproto_includedir = ${xorgrecordproto_DEPDIR}/recordproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgrecordproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
