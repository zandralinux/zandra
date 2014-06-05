<$alsalib_DEPDIR/v.mk

alsalib_libdir = $alsalib_DEPDIR/alsa-lib-$v/lib/lib
alsalib_includedir = $alsalib_DEPDIR/alsa-lib-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${alsalib_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${alsalib_libdir} -lasound
