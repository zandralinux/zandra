<$xorglibdrm_DEPDIR/v.mk

xorglibdrm_libdir = $xorglibdrm_DEPDIR/libdrm-$v/lib/lib
xorglibdrm_includedir = $xorglibdrm_DEPDIR/libdrm-$v/lib/include
xorglibdrm_includedrmdir = $xorglibdrm_DEPDIR/libdrm-$v/lib/include/libdrm
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibdrm_includedir} -I${xorglibdrm_includedrmdir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibdrm_libdir} -ldrm
