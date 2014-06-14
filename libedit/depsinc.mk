<$libedit_DEPDIR/v.mk

libedit_libdir = ${libedit_DEPDIR}/libedit-20140213-$v/lib/lib
libedit_includedir = ${libedit_DEPDIR}/libedit-20140213-$v/lib/include

libedit_CFLAGS = -I${libedit_includedir}
libedit_LDFLAGS = -L${libedit_libdir}

DEPS_CFLAGS = $DEPS_CFLAGS ${libedit_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libedit_LDFLAGS}
