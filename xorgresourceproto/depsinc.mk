<$xorgresourceproto_DEPDIR/v.mk

xorgresourceproto_libdir = ${xorgresourceproto_DEPDIR}/resourceproto-$v/lib/lib
xorgresourceproto_includedir = ${xorgresourceproto_DEPDIR}/resourceproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgresourceproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
