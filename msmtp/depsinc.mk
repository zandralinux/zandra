<$bzip2_DEPDIR/v.mk

bzip2_libdir = $bzip2_DEPDIR/bzip2-$v
bzip2_includedir = $bzip2_DEPDIR/bzip2-$v
DEPS_CFLAGS = $DEPS_CFLAGS -I${bzip2_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${bzip2_libdir} -lbz2
