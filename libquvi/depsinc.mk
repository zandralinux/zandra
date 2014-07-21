<$libquvi_DEPDIR/v.mk

libquvi_bindir = ${libquvi_DEPDIR}/libquvi-$v/lib/bin
libquvi_libdir = ${libquvi_DEPDIR}/libquvi-$v/lib/lib
libquvi_includedir = ${libquvi_DEPDIR}/libquvi-$v/lib/include

libquvi_CFLAGS = -I${libquvi_includedir}
libquvi_LDFLAGS = -L${libquvi_libdir} -lquvi

DEPS_CFLAGS = $DEPS_CFLAGS ${libquvi_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libquvi_LDFLAGS}
