<$mkbuild/mk.common-noinst

install:QV:
	mkdir -p "$ROOT/lib/firmware"
	cp -r * "$ROOT/lib/firmware"
	rm -f "$ROOT/lib/firmware/WHENCE"
	rm -f "$ROOT/lib/firmware/"LICENSE.*
	rm -f "$ROOT/lib/firmware/"LICENCE.*
