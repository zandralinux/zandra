<$libpthreadstubs_DEPDIR/v.mk

libpthreadstubs_libdir = $libpthreadstubs_DEPDIR/libpthread-stubs-$v/lib/lib
libpthreadstubs_includedir = $libpthreadstubs_DEPDIR/libpthread-stubs-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${libpthreadstubs_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libpthreadstubs_libdir}
