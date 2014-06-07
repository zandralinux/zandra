TARG = openssh
DEPS = zlib openssl

<$mkbuild/mk.common-noinst

openssh:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# prevent from installing some things (keysign and maybe others) setuid.
	sed -i 's@-m 4711@-m 0750@g' Makefile.in
	# work around for issue #104 until we come up with a proper patch
	issue104cflags="-fno-builtin-exit -D__noreturn__="
	CC="${CC} -static" \
	ac_cv_path_AR="${AR}" \
	CFLAGS="$issue104cflags -D_BSD_SOURCE -DMISSING_FD_MASK -DMISSING_NFDBITS $CFLAGS" \
		./configure -C \
			--prefix="$PREFIX" \
			--sbindir="$PREFIX"/bin --libexecdir="$PREFIX"/lib/ssh \
			--sysconfdir="$PREFIX"/etc/ssh \
			--with-privsep-user=nobody \
			--with-md5-passwords --with-mantype=man --mandir="$PREFIX"/share/man \
			--disable-strip --disable-lastlog --disable-utmp --disable-utmpx --disable-btmp \
			--disable-wtmp --disable-wtmpx --disable-pututline --disable-pututxline
	mkdir netinet
	touch netinet/in_systm.h
	sed -i '/USE_BTMP/d' config.h
	sed -i '/USE_UTMP/d' config.h
	sed -i 's@HAVE_DECL_HOWMANY 1@HAVE_DECL_HOWMANY 0@' config.h
	make -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install-nokeys

