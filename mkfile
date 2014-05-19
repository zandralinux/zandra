`{ test -e config.mk || cp config.def.mk config.mk }

configmk = `{pwd}/config.mk
mkbuild = `{pwd}/mkbuild

<$configmk

all:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk TARG="$TARG"
	fi

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
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk clean
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk clean TARG="$TARG"
	fi

distclean:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk distclean
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk distclean TARG="$TARG"
	fi

fetch:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk fetch
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk fetch TARG="$TARG"
	fi

package:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk package
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk package TARG="$TARG"
	fi
