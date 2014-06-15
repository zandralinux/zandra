<$libjpegturbo_DEPDIR/v.mk

libjpegturbo_libdir = ${libjpegturbo_DEPDIR}/libjpeg-turbo-$v
libjpegturbo_includedir = ${libjpegturbo_DEPDIR}/libjpeg-turbo-$v

libjpegturbo_CFLAGS = -I${libjpegturbo_includedir}
libjpegturbo_LDFLAGS = -L${libjpegturbo_libdir} -ljpeg # -lturbojpeg?

DEPS_CFLAGS = $DEPS_CFLAGS ${libjpegturbo_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libjpegturbo_LDFLAGS}
