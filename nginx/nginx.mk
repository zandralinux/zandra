TARG = nginx
DEPS = libressl pcre zlib

<$mkbuild/mk.common-noinst

nginx:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# nginx incorrectly detects GNU crypt so set: -DNGX_HAVE_GNU_CRYPT_R=0"
	export CFLAGS="$CFLAGS -DNGX_HAVE_GNU_CRYPT_R=0"
	export BUILDCC="${CC}"
	export CC="${CC} -static"
	# make nginx believe we are building pcre, but actually we
	# use the prebuilt pcre from ports.
	export pcre_localdir="`pwd`/pcre"
	mkdir -p "${pcre_localdir}"
	printf '#!/bin/sh\ntrue' > "${pcre_localdir}/configure"
	chmod 755 "${pcre_localdir}/configure"
	printf 'all:\n\ttrue\nlibpcre.la:\n\ttrue\ninstall:\n\ttrue\ndistclean:\n\ttrue\nclean:\n\ttrue' > "${pcre_localdir}/Makefile"
	ln -sf "${pcre_libdir}" "${pcre_localdir}/.libs"
	# don't rebuild pcre source, use the ports version.
	# See: http://wiki.nginx.org/InstallOptions#Notes
	#   --with-ld-opt="-L${pcre_libdir}"
	#   --with-cc-opt="-I${pcre_includedir}"
	CC="$HOSTCC -static" ./configure \
		--prefix=/etc/nginx \
		--conf-path=/etc/nginx/nginx.conf \
		--sbin-path=${prefix}/bin/nginx \
		--error-log-path=/var/log/nginx/access.log \
		--error-log-path=stderr \
		--pid-path=/run/nginx.pid \
		--lock-path=/run/lock/nginx.lock \
		--user=http \
		--group=http \
		--with-file-aio \
		--with-pcre="${pcre_localdir}" \
		--with-zlib="${zlib_libdir}" \
		--with-openssl="${libressl_libdir}" \
		--with-ipv6 \
		--with-ld-opt="-L${pcre_libdir}" \
		--with-cc-opt="-I${pcre_includedir}"
	make -j$nprocs CC="$BUILDCC -static"

install:QV:
	$INSTALL -d -m 755 "$ROOT/run/lock"
	make -j$nprocs install CC="$CC -static" DESTDIR="$ROOT"
