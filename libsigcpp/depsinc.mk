<$libsigcpp_DEPDIR/v.mk

libsigcpp_libdir = $libsigcpp_DEPDIR/libsigc++-$v/lib/lib
libsigcpp_includedir = $libsigcpp_DEPDIR/libsigc++-$v/lib/include/sigc++-2.0
DEPS_CFLAGS = $DEPS_CFLAGS -I${libsigcpp_includedir} -I${libsigcpp_libdir}/sigc++-2.0/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libsigcpp_libdir} -lsigc-2.0
