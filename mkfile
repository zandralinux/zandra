`{ test -e config.mk || cp config.def.mk config.mk }

configmk = `{pwd}/config.mk
mkbuild = `{pwd}/mkbuild

TARG = stage0

all: $TARG

&:
	cd ports/stage0
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk

clean:
	cd ports
	mk configmk="$configmk" mkbuild="$mkbuild" clean

submodule:
	git submodule init
	git submodule update --remote