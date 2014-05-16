<$xorgdmxproto_DEPDIR/v.mk

xorgdmxproto_libdir = ${xorgdmxproto_DEPDIR}/dmxproto-$v/lib/lib
xorgdmxproto_includedir = ${xorgdmxproto_DEPDIR}/dmxproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgdmxproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
