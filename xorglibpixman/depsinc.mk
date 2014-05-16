<$xorglibpixman_DEPDIR/v.mk

xorglibpixman_libdir = $xorglibpixman_DEPDIR/pixman-$v/lib/lib
xorglibpixman_includedir = $xorglibpixman_DEPDIR/pixman-$v/lib/include/pixman-1
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibpixman_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibpixman_libdir} -lpixman-1
