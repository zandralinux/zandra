<$libass_DEPDIR/v.mk

libass_bindir = ${libass_DEPDIR}/libass-$v/lib/bin
libass_libdir = ${libass_DEPDIR}/libass-$v/lib/lib
libass_includedir = ${libass_DEPDIR}/libass-$v/lib/include

libass_CFLAGS = -I${libass_includedir}
libass_LDFLAGS = -L${libass_libdir} -lass

DEPS_CFLAGS = $DEPS_CFLAGS ${libass_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libass_LDFLAGS}
