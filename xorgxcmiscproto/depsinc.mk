<$xorgxcmiscproto_DEPDIR/v.mk

xorgxcmiscproto_libdir = ${xorgxcmiscproto_DEPDIR}/xcmiscproto-$v/lib/lib
xorgxcmiscproto_includedir = ${xorgxcmiscproto_DEPDIR}/xcmiscproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxcmiscproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
