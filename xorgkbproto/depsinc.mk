<$xorgkbproto_DEPDIR/v.mk

xorgkbproto_libdir = ${xorgkbproto_DEPDIR}/kbproto-$v/lib
xorgkbproto_includedir = ${xorgkbproto_DEPDIR}/kbproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgkbproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
