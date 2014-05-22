<$xorgxf86dgaproto_DEPDIR/v.mk

xorgxf86dgaproto_libdir = ${xorgxf86dgaproto_DEPDIR}/xf86dgaproto-$v/lib/lib
xorgxf86dgaproto_includedir = ${xorgxf86dgaproto_DEPDIR}/xf86dgaproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxf86dgaproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
