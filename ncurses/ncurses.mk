TARG = libncurses
INSTALL_BIN = progs/tic progs/tput progs/tset progs/infocmp progs/toe progs/tabs
INSTALL_MAN1 = man/tic.1m man/tput.1 man/tset.1 man/infocmp.1m man/toe.1m man/tabs.1
INSTALL_MAN5 = man/terminfo.5

<$mkbuild/mk.common

libncurses:QV:
	cp ../ncurses-fallback.c ncurses/fallback.c
	CC="$CC -static" ./configure \
		--prefix="$PREFIX" --mandir="$MANDIR" \
	   --datadir="$PREFIX/share" --without-tests \
	   --with-normal --enable-sigwinch --disable-nls --without-dlsym \
	   --without-cxx-binding --enable-widec \
	   --with-fallbacks="linux vt100 xterm xterm256-color" </dev/ptmx
	make -j$nprocs
	ln -sf curses.h include/ncurses.h
	cd lib
	for lib in ncurses form panel menu ; do
		ln -sf lib${lib}w_g.a lib${lib}_g.a
		ln -sf lib${lib}w.a lib${lib}.a
	done

