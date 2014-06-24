<$termcap_DEPDIR/v.mk

termcap_libdir = ${termcap_DEPDIR}/termcap-$v
termcap_includedir = ${termcap_DEPDIR}/termcap-$v

termcap_CFLAGS = -I${termcap_includedir}
termcap_LDFLAGS = -L${termcap_libdir}

DEPS_CFLAGS = $DEPS_CFLAGS ${termcap_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${termcap_LDFLAGS} -ltermcap
