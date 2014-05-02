<$xorgxproto_DEPDIR/v.mk

xorgxproto_libdir = ${xorgxproto_DEPDIR}/xproto-$v/lib/lib
xorgxproto_includedir = ${xorgxproto_DEPDIR}/xproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
