# make deps: bash.
TARG = gdb
DEPS = libedit termcap zlib

<$mkbuild/mk.common-noinst

gdb:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# bash dependency: see https://sourceware.org/bugzilla/show_bug.cgi?id=16370
	# fix missing "makeinfo" requirement...
	find . -name 'configure' -exec sed -i 's,MAKEINFO="$MISSING makeinfo",MAKEINFO=true,' '{}' \;
	# remove hardcoded -O2 -g CFLAGS which are *not* overridable (i.e. always appended, taking precedence)
	find . -name 'configure' -exec sed -e 's/CFLAGS="-g -O2"/:/g' -e 's/CFLAGS="-O2"/:/g' -i '{}' \;
	#
	sh ../libibertyfix libiberty
	#
	sh ../gnulibfix gdb/gnulib/import
	#
	mkdir -p build
	cd build
	cp ../../config.cache .
	# fixing implicit declaration in recursively called (by make) configure tests...
	cat ../../gdb-config-add >> config.cache
	# readline and and libiberty have broken checks; but we have to copy config.cache
	# everywhere to get cache.
	for culprit in readline libiberty libdecnumber opcodes readline bfd; do
		mkdir -p $culprit
		cp config.cache $culprit/
	done
	sed -i 's/noconfigdirs=""/noconfigdirs="intl readline"/' ../configure
	# let's use libedit instead of readline and save us from the in-tree compile of the latter...
	cp "${libedit_libdir}/libedit.a" readline/libreadline.a
	archflags=""
	#
	gdbserverflags="--enable-gdbserver=no"
#	gdbserverflags="--enable-gdbserver=yes --disable-inprocess-agent"
#	[ "$WANT_GDBSERVER" = 1 ] &&
#	gdbserverflags=""
	# gdbserver tries to build some .so for inprocess-agent, but it doesnt strip away -static
	# from LDFLAGS, so it tries to link the .so with -shared -static, which can't work
	xconfflags=""
	targets="--enable-64-bit-bfd --enable-targets=x86_64-linux,i386-linux,powerpc-linux,arm-linux,mips-linux,mipsel-linux,microblaze-linux"
	#if [ -n "$CROSS_COMPILE" ] ; then
	xconfflags="--host=${TOOLCHAIN_TRIPLET}"
	targets=""
	#fi
	#
	LDFLAGS="-static $DEPS_LDFLAGS $optldflags" \
	CFLAGS="-Dgnu_fnmatch=fnmatch -D_GNU_SOURCE -D_LARGEFILE64_SOURCE -O0 $DEPS_CFLAGS $optcflags $archflags" \
	../configure -C \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--disable-werror --disable-tls \
		--with-system-zlib=no \
		$gdbserverflags $xconfflags $targets \
		--disable-sim \
		--disable-tui
	make -j$nprocs

install:QV:
	cd build
	make -j$nprocs install-gdb DESTDIR="$ROOT"
