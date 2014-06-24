# make deps: perl.
# TODO: use libattr, for libpcap/cap_file.c ?
TARG = libcap
# DEPS = libattr?

INSTALL_BIN = \
	progs/capsh \
	progs/getcap \
	progs/getpcaps \
	progs/setcap

INSTALL_MAN3 = \
	`{ ls doc/*.3 }

INSTALL_MAN8 = \
	`{ ls doc/*.8 }

<$mkbuild/mk.common

libcap:QV:
	cp ../make.rules Make.Rules
	cp ../libcap_makefile libcap/Makefile
	sed 's@/bin/bash@/bin/sh@g' -i progs/capsh.c
	# install lib for use as a dependency.
	make -j$nprocs install \
		prefix="/" \
		lib="/lib" \
		BUILD_CC="$HOSTCC" \
		CFLAGS="$CFLAGS" \
		LDFLAGS="$LDFLAGS" \
		FAKEROOT="`pwd`/lib" \
		DESTDIR="`pwd`/lib" \
		PAM_CAP="no" \
		RAISE_SETFCAP="no" \
		CC="$CC -static" \
		LD="$LD"
		AR="$AR" \
		RANLIB="$RANLIB"
