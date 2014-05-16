<$xorglibxkbfile_DEPDIR/v.mk

xorglibxkbfile_includedir = ${xorglibxkbfile_DEPDIR}/libxkbfile-$v/lib/include
xorglibxkbfile_libdir = ${xorglibxkbfile_DEPDIR}/libxkbfile-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxkbfile_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxkbfile_libdir} -lxkbfile
