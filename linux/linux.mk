# make deps: bash, bc, perl
TARG = linux bzImage.config
INSTALL_OTHER1 = arch/x86/boot/bzImage bzImage.config System.map
INSTALL_OTHER1_DIR = /boot

<$mkbuild/mk.common

bzImage.config:Q:
	cp .config bzImage.config

linux:Q:
	cp ../kernel-config-$arch .config
	case "$arch" in
	x86_64)
		A=x86_64
		;;
	i486)
		A=x86
		;;
	esac
	make ARCH="$A" bzImage -j$nprocs

