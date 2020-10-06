`{ test -e config.mk || cp config.def.mk config.mk }

configmk = `{pwd}/config.mk
mkbuild = `{pwd}/mkbuild
ROOT = `{pwd}/root

<$configmk

all:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk package
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" TARG="$TARG" mk package
	fi

init:QV:
	git submodule init
	git submodule update --remote

bootable:V:
	stuff/create-bootable "$ROOT" zandra-$version-$arch.img

install:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" ROOT="$ROOT" TARG="$TARG" mk installpkgs

clean:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk clean
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" TARG="$TARG" mk clean
	fi

distclean:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk distclean
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" TARG="$TARG" mk distclean 
	fi

fetch:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk fetch
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" TARG="$TARG" mk fetch 
	fi

package:QV:
	cd ports
	if test "$TARG" = ""; then
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk package
	else
		env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" TARG="$TARG" mk package 
	fi
