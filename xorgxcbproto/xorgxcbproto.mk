# make deps: python2.7, xmllint (libxml2).
TARG = xorgxcbproto

<$mkbuild/mk.common-noinst

$TARG:QV:
	export PYTHON="python2.7"
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs install DESTDIR="`pwd`/lib/"
