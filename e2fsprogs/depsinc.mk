<$e2fsprogs_DEPDIR/v.mk

e2fsprogs_includedir = ${e2fsprogs_DEPDIR}/e2fsprogs-$v/libdev/lib
e2fsprogs_libdir = ${e2fsprogs_DEPDIR}/e2fsprogs-$v/libdev/lib/uuid

e2fsprogs_CFLAGS = -I${e2fsprogs_includedir}
e2fsprogs_LDFLAGS = -L${e2fsprogs_libdir} -luuid

DEPS_CFLAGS = $DEPS_CFLAGS ${e2fsprogs_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${e2fsprogs_LDFLAGS}
