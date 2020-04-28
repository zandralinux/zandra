<$gcc_DEPDIR/v.mk

gcc_libdir = $gcc_DEPDIR/gcc-$v/lib/lib
gcc_includedir = $gcc_DEPDIR/gcc-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${gcc_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${gcc_libdir}
