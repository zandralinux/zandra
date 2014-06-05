<$libmad_DEPDIR/v.mk

libmad_libdir = $libmad_DEPDIR/libmad-$v/lib/lib
libmad_includedir = $libmad_DEPDIR/libmad-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${libmad_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libmad_libdir} -lmad
