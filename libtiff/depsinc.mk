<$libtiff_DEPDIR/v.mk

libtiff_bindir = ${libtiff_DEPDIR}/tiff-$v/lib/bin
libtiff_libdir = ${libtiff_DEPDIR}/tiff-$v/lib/lib
libtiff_includedir = ${libtiff_DEPDIR}/tiff-$v/lib/include

libtiff_CFLAGS = -I${libtiff_includedir}
libtiff_LDFLAGS = -L${libtiff_libdir} -ltiff

DEPS_CFLAGS = $DEPS_CFLAGS ${libtiff_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libtiff_LDFLAGS}
