`{ test -e config.mk || cp config.def.mk config.mk }

configmk = `{pwd}/config.mk
mkbuild = `{pwd}/mkbuild

all:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk

submodule:QV:
	git submodule init
	git submodule update --remote

install:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk install ROOT="${ROOT}"

clean:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk clean

fetch:QV:
	cd ports
	env -i PATH="$PATH" configmk="$configmk" mkbuild="$mkbuild" mk fetch

