TARG = nginx
DEPS = openssl pcre zlib

<$mkbuild/mk.common-noinst

nginx:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# nginx incorrectly detects GNU crypt so set: -DNGX_HAVE_GNU_CRYPT_R=0"
	export CFLAGS="$CFLAGS -DNGX_HAVE_GNU_CRYPT_R=0"
	export CC="${CC} -static"
	# don't rebuild pcre source, use the ports version.
	# See: http://wiki.nginx.org/InstallOptions#Notes
	#   --with-ld-opt="-L${pcre_libdir}"
	#   --with-cc-opt="-I${pcre_includedir}"
	./configure \
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
		--with-pcre \
		--with-zlib=${zlib_libdir} \
		--with-openssl=${openssl_libdir} \
		--with-ipv6 \
		--with-ld-opt="-L${pcre_libdir}" \
		--with-cc-opt="-I${pcre_includedir}"
	make -j$nprocs

install:QV:
	$INSTALL -d -m 755 "$ROOT/run/lock"
	make -j$nprocs install DESTDIR="$ROOT"
