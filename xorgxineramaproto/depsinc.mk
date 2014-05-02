<$xorgxineramaproto_DEPDIR/v.mk

xorgxineramaproto_libdir = ${xorgxineramaproto_DEPDIR}/xineramaproto-$v/lib
xorgxineramaproto_includedir = ${xorgxineramaproto_DEPDIR}/xineramaproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxineramaproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
