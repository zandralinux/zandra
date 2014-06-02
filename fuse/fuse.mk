TARG = fuse
INSTALL_BIN = \
	util/mount.fuse \
	util/fusermount \
	util/ulockmgr_server
INSTALL_MAN1 = `{ ls -1 doc/*.1 }
INSTALL_MAN8 = `{ ls -1 doc/*.8 }

<$mkbuild/mk.common

fuse:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-util \
		--enable-lib \
		--enable-static
	make -j$nprocs LDFLAGS="-all-static $LDFLAGS"
	# for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/liba LDFLAGS="-all-static $LDFLAGS"
	# remove .la files for now ?
	find `pwd`/liba -iname "*.la" -exec rm {} \;
