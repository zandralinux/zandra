`{ test -e config.mk || cp config.def.mk config.mk }

TARG = stage0

all: $TARG

&:
	cd ports/stage0
	mk

clean:
	cd ports
	mk clean

submodule:
	git submodule init
	git submodule update