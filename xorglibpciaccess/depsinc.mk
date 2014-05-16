<$xorglibpciaccess_DEPDIR/v.mk

xorglibpciaccess_libdir = $xorglibpciaccess_DEPDIR/libpciaccess-$v/lib/lib
xorglibpciaccess_includedir = $xorglibpciaccess_DEPDIR/libpciaccess-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibpciaccess_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibpciaccess_libdir} -lpciaccess
