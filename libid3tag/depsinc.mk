<$libid3tag_DEPDIR/v.mk

libid3tag_libdir = $libid3tag_DEPDIR/libid3tag-$v/lib/lib
libid3tag_includedir = $libid3tag_DEPDIR/libid3tag-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${libid3tag_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libid3tag_libdir} -lid3tag
