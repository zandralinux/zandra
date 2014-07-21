TARG = vim
DEPS = ncurses

<$mkbuild/mk.common-noinst

vim:QV:
	export CPPFLAGS="$DEPS_CFLAGS $CFLAGS"
	export LDFLAGS="$DEPS_LDFLAGS $LDFLAGS"
	export vim_cv_toupper_broken="no"
	export vim_cv_terminfo="yes"
	export vim_cv_tty_group="world"
	export vim_cv_tty_mode="0620"
	export vim_cv_getcwd_broken="no"
	export vim_cv_stat_ignores_slash="no"
	export vim_cv_memmove_handles_overlap="yes"
	./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX/" \
		--disable-gui \
		--disable-nls \
		--disable-netbeans \
		--without-local-dir \
		--with-x=no \
		--enable-multibyte \
		--with-tlib=ncurses
	make -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install
	$INSTALL -d -m 755 $ROOT/$BINDIR
	ln -sf vim $ROOT/$BINDIR/vi
