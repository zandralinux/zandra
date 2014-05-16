<$xorglibxdmcp_DEPDIR/v.mk

xorglibxdmcp_includedir = ${xorglibxdmcp_DEPDIR}/libXdmcp-$v/lib/include
xorglibxdmcp_libdir = ${xorglibxdmcp_DEPDIR}/libXdmcp-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxdmcp_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxdmcp_libdir} -lXdmcp
