<$e2fsprogs_DEPDIR/v.mk

e2fsprogs_includedir = ${e2fsprogs_DEPDIR}/e2fsprogs-$v/lib
e2fsprogs_libdir = ${e2fsprogs_DEPDIR}/e2fsprogs-$v/lib/uuid

DEPS_CFLAGS = $DEPS_CFLAGS -I${e2fsprogs_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${e2fsprogs_libdir} -luuid
