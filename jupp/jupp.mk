TARG = jupp

<$mkbuild/mk.common

INSTALL_BIN = joe
INSTALL_MAN1 = joe.1
INSTALL_OTHER1 = charmaps/klingon
INSTALL_OTHER1_DIR = /etc/joe/charmaps
INSTALL_OTHER2 = joerc jmacsrc
INSTALL_OTHER2_DIR = /etc/joe
INSTALL_OTHER3 = `{ls syntax/*}
INSTALL_OTHER3_DIR = /etc/joe/syntax
INSTALL_SYMLINK = joe /bin/jmacs \
	joe.1 $MANDIR/man1/jmacs.1

jupp:QV:
	sh configure \
		--prefix="$PREFIX"
	make -j$nprocs
