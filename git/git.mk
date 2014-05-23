TARG = git
DEPS = curl openssl zlib

<$mkbuild/mk.common-noinst

git:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# NOTE: "$prefix/" is needed to set the proper mandir.
	make CURL_LIBCURL="${curl_libdir}/libcurl.a ${openssl_libdir}/libssl.a ${openssl_libdir}/libcrypto.a" \
	CC="$CC -static" \
		AR="$AR" \
		prefix="$prefix/" gitexecdir="$prefix"/lib/git-core \
		NO_TCLTK=1 NO_PYTHON=1 NO_EXPAT=1 NO_GETTEXT=1 \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS -static" \
		DESTDIR="$ROOT" -j$nprocs V=1 all

install:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# NOTE: "$prefix/" is needed to set the proper mandir.
	make CURL_LIBCURL="${curl_libdir}/libcurl.a ${openssl_libdir}/libssl.a ${openssl_libdir}/libcrypto.a" \
	CC="$CC -static" \
		AR="$AR" \
		prefix="$prefix/" gitexecdir="$prefix"/lib/git-core \
		NO_TCLTK=1 NO_PYTHON=1 NO_EXPAT=1 NO_GETTEXT=1 \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS -static" \
		DESTDIR="$ROOT" -j$nprocs V=1 all install
