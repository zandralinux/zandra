<$freetype_DEPDIR/v.mk

freetype_libdir = ${freetype_DEPDIR}/freetype-$v/lib/lib
freetype_includedir = ${freetype_DEPDIR}/freetype-$v/lib/include/freetype2

freetype_CFLAGS = -I${freetype_includedir}
freetype_LDFLAGS = -L${freetype_libdir} -lfreetype

DEPS_CFLAGS = $DEPS_CFLAGS ${freetype_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${freetype_LDFLAGS}
