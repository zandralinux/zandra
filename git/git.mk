TARG = git
DEPS = curl libressl zlib

<$mkbuild/mk.common-noinst

git:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# https://sourceware.org/bugzilla/show_bug.cgi?id=16698
	test x"$arch" = x"arm" && export LDFLAGS="`printf "%s" \"$LDFLAGS\" | sed 's@-Wl,--gc-sections@@g'`"
	# NOTE: "$PREFIX/" is needed to set the proper mandir.
	make CURL_LIBCURL="${curl_libdir}/libcurl.a ${libressl_libdir}/libssl.a ${libressl_libdir}/libcrypto.a" \
	CC="$CC -static" \
		AR="$AR" \
		prefix="$PREFIX/" gitexecdir="$PREFIX"/lib/git-core \
		NO_TCLTK=1 NO_PYTHON=1 NO_EXPAT=1 NO_GETTEXT=1 \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS -static" \
		DESTDIR="$ROOT" -j$nprocs V=1 all

install:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# https://sourceware.org/bugzilla/show_bug.cgi?id=16698
	test x"$arch" = x"arm" && export LDFLAGS="`printf "%s" \"$LDFLAGS\" | sed 's@-Wl,--gc-sections@@g'`"
	# NOTE: "$PREFIX/" is needed to set the proper mandir.
	make CURL_LIBCURL="${curl_libdir}/libcurl.a ${libressl_libdir}/libssl.a ${libressl_libdir}/libcrypto.a" \
	CC="$CC -static" \
		AR="$AR" \
		prefix="$PREFIX/" gitexecdir="$PREFIX"/lib/git-core \
		NO_TCLTK=1 NO_PYTHON=1 NO_EXPAT=1 NO_GETTEXT=1 \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS -static" \
		DESTDIR="$ROOT" -j$nprocs V=1 all install
