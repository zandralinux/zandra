`{ test -e config.mk || cp config.def.mk config.mk }

configmk = `{pwd}/config.mk
mkbuild = `{pwd}/mkbuild

<$configmk

all:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk TARG="$TARG"

init:QV:
	git submodule init
	git submodule update --remote

bootable:V:
	stuff/create-bootable "$ROOT" morpheus-$arch-$version.img

install:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk install ROOT="${ROOT}" TARG="$TARG"

clean:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk clean TARG="$TARG"

distclean:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk distclean TARG="$TARG"

fetch:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk fetch TARG="$TARG"

