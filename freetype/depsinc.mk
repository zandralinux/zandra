<$freetype_DEPDIR/v.mk

freetype_libdir = $freetype_DEPDIR/freetype-$v/lib/lib
freetype_includedir = $freetype_DEPDIR/freetype-$v/lib/include/freetype2
DEPS_CFLAGS = $DEPS_CFLAGS -I${freetype_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${freetype_libdir} -lfreetype
