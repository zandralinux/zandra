<$mkbuild/mk.common-noinst

install:QV:
	mkdir -p "$ROOT/devel"
	cp -ar * "$ROOT/devel"
	mkdir -p "$ROOT/bin"
	cd "$ROOT/bin"
	symlinks="ar as c++ g++ gcc ld ld.bfd nm objcopy objdump ranlib strip"
	for i in $symlinks; do
		ln -sf /devel/bin/x86_64-linux-musl-$i $i
	done
	ln -sf /bin/gcc cc
