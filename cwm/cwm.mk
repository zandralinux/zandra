TARG = cwm
INSTALL_BIN = cwm
DEPS = \
	fontconfig \
	xorglibxft \
	freetype \
	expat \
	xorglibxcb \
	xorglibxext \
	xorglibxrender \
	xorgrenderproto \
	xorglibx11 \
	xorglibxcb \
	xorgxcbproto \
	xorgxproto \
	xorglibxau \
	xorgkbproto \
	xorglibxrandr \
	xorglibxinerama \
	xorgxineramaproto \
	xorgrandrproto \
	xorglibxdmcp \
	libpng \
	zlib

<$mkbuild/mk.common

cwm:QV:
	export CFLAGS="-I. $CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export LDFLAGS="-Wl,--start-group $LDFLAGS -Wl,--end-group"
	mkdir -p sys
	cp ../sys/queue.h sys
	yacc parse.y
	for i in *.c; do
		$CC -c $CFLAGS $i $LDFLAGS
	done
	$LD $CFLAGS -o cwm *.o $LDFLAGS

clean:QV:
	rm *.o y.tab.c
