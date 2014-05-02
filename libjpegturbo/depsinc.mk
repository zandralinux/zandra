<$libjpegturbo_DEPDIR/v.mk

libjpegturbo_libdir = $libjpegturbo_DEPDIR/libjpeg-turbo-$v/lib/lib/libjpeg-turbo
libjpegturbo_includedir = $libjpegturbo_DEPDIR/libjpeg-turbo-$v/lib/include/libjpeg-turbo
DEPS_CFLAGS = $DEPS_CFLAGS -I${libjpegturbo_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libjpegturbo_libdir} -ljpeg # -lturbojpeg?
