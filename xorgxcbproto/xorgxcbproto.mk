# make deps: python2.7
TARG = xorgxcbproto

<$mkbuild/mk.common-noinst

xorgxcbproto:QV:
	export PYTHON="/bin/python2.7"
	./configure --prefix="$prefix" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib/"

install:QV:
	false
