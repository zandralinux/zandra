<$xorgvideoproto_DEPDIR/v.mk

xorgvideoproto_libdir = ${xorgvideoproto_DEPDIR}/videoproto-$v/lib/lib
xorgvideoproto_includedir = ${xorgvideoproto_DEPDIR}/videoproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgvideoproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
