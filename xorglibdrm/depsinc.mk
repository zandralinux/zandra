<$xorglibdrm_DEPDIR/v.mk

xorglibdrm_libdir = $xorglibdrm_DEPDIR/libdrm-$v/lib/lib
xorglibdrm_includedir = $xorglibdrm_DEPDIR/libdrm-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibdrm_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibdrm_libdir} -libdrm
