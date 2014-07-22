<$libfribidi_DEPDIR/v.mk

libfribidi_bindir = ${libfribidi_DEPDIR}/fribidi-$v/lib/bin
libfribidi_libdir = ${libfribidi_DEPDIR}/fribidi-$v/lib/lib
libfribidi_includedir = ${libfribidi_DEPDIR}/fribidi-$v/lib/include/fribidi

libfribidi_CFLAGS = -I${libfribidi_includedir}
libfribidi_LDFLAGS = -L${libfribidi_libdir} -lfribidi

DEPS_CFLAGS = $DEPS_CFLAGS ${libfribidi_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libfribidi_LDFLAGS}
