<$pcre_DEPDIR/v.mk

pcre_dir = ${pcre_DEPDIR}/pcre-$v
pcre_includedir = ${pcre_dir}
pcre_libdir = ${pcre_DEPDIR}/pcre-$v/.libs

pcre_CFLAGS = -I${pcre_includedir}
pcre_LDFLAGS = -L${pcre_libdir} -lpcre

DEPS_CFLAGS = $DEPS_CFLAGS ${pcre_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${pcre_LDFLAGS}
