TARG = libedit
DEPS = ncurses

<$mkbuild/mk.common-noinst

libedit:QV:
	# -D__STDC_ISO_10646__ fixes error:
	#  "wchar_t must store ISO 10646 characters".
	export CFLAGS="$CFLAGS $DEPS_CFLAGS -D__STDC_ISO_10646__"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--enable-widec
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
	# make symlink for use as a readline replacement.
	ln -sf libedit.a "`pwd`/lib/lib/libreadline.a"
	# readline headers.
	mkdir -p "`pwd`/lib/include/readline"
	touch "`pwd`/lib/include/readline/history.h"
	touch "`pwd`/lib/include/readline/tilde.h"
	cp src/editline/readline.h "`pwd`/lib/include/readline/readline.h"
