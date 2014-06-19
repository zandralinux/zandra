<$expat_DEPDIR/v.mk

expat_libdir = $expat_DEPDIR/expat-$v/lib/lib
expat_includedir = $expat_DEPDIR/expat-$v/lib/include

expat_CFLAGS = -I${expat_includedir}
expat_LDFLAGS = -L${expat_libdir} -lexpat

DEPS_CFLAGS = $DEPS_CFLAGS ${expat_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${expat_LDFLAGS}
