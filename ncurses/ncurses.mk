TARG = ncurses

<$mkbuild/mk.common

ncurses:QV:
	cp ../ncurses-fallback.c ncurses/fallback.c
	CC="$CC -static" ./configure --prefix="$PREFIX" --mandir="$MANDIR" \
	   --datadir="$PREFIX/share" --without-tests \
	   --with-normal --enable-sigwinch --disable-nls --without-dlsym \
	   --without-cxx-binding --enable-widec \
	   --with-fallbacks="linux vt100 xterm xterm256-color" </dev/ptmx
	make -j$nprocs
	cd lib
	for lib in ncurses form panel menu ; do
		ln -sf lib${lib}w_g.a lib${lib}_g.a
		ln -sf lib${lib}w.a lib${lib}.a
	done

