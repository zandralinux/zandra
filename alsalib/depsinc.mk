<$alsalib_DEPDIR/v.mk

alsalib_libdir = $alsalib_DEPDIR/alsa-lib-$v/lib/lib
alsalib_includedir = $alsalib_DEPDIR/alsa-lib-$v/lib/include

alsalib_CFLAGS = -I${alsalib_includedir}
alsalib_LDFLAGS = -L${alsalib_libdir} -lasound

DEPS_CFLAGS = $DEPS_CFLAGS ${alsalib_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${alsalib_LDFLAGS}
