<$xorgscrnsaverproto_DEPDIR/v.mk

xorgscrnsaverproto_libdir = ${xorgscrnsaverproto_DEPDIR}/scrnsaverproto-$v/lib/lib
xorgscrnsaverproto_includedir = ${xorgscrnsaverproto_DEPDIR}/scrnsaverproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgscrnsaverproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
