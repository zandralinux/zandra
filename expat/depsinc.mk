<$expat_DEPDIR/v.mk

expat_libdir = $expat_DEPDIR/expat-$v/lib/lib
expat_includedir = $expat_DEPDIR/expat-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${expat_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${expat_libdir} -lexpat
