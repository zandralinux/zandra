TARG = xorgxproto

<$mkbuild/mk.common-noinst

xorgxproto:QV:
	./configure --prefix="$prefix" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"

install:QV:
	false
