<$libav_DEPDIR/v.mk

libav_bindir = ${libav_DEPDIR}/libav-$v/lib/usr/local/bin
libav_libdir = ${libav_DEPDIR}/libav-$v/lib/usr/local/lib
libav_includedir = ${libav_DEPDIR}/libav-$v/lib/usr/local/include

libav_CFLAGS = -I${libav_includedir}
libav_LDFLAGS = -L${libav_libdir} -lavformat -lavfilter -lavcodec -lavdevice -lswscale -lavresample -lavutil

DEPS_CFLAGS = $DEPS_CFLAGS ${libav_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libav_LDFLAGS}
