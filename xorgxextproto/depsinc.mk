<$xorgxextproto_DEPDIR/v.mk

xorgxextproto_libdir = ${xorgxextproto_DEPDIR}/xextproto-$v/lib
xorgxextproto_includedir = ${xorgxextproto_DEPDIR}/xextproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxextproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
