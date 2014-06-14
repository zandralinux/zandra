<$fastcgi_DEPDIR/v.mk

fastcgi_bindir = ${fastcgi_DEPDIR}/fcgi-$v/lib/bin
fastcgi_libdir = ${fastcgi_DEPDIR}/fcgi-$v/lib/lib
fastcgi_includedir = ${fastcgi_DEPDIR}/fcgi-$v/lib/include

fastcgi_CFLAGS = -I${fastcgi_includedir}
fastcgi_LDFLAGS = -L${fastcgi_libdir} -lfcgi

DEPS_CFLAGS = $DEPS_CFLAGS ${fastcgi_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${fastcgi_LDFLAGS}
