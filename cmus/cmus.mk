TARG = cmus
DEPS = ncurses

<$mkbuild/mk.common-noinst

cmus:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	#
	./configure \
		CROSS="${HOST_TOOLCHAIN_TRIPLET}-" \
		HOSTCC=${HOST_TOOLCHAIN_TRIPLET}-gcc \
		HOST_LD=${HOST_TOOLCHAIN_TRIPLET}-gcc \
		HOST_CFLAGS="$CFLAGS" \
		HOST_LDFLAGS="$LDFLAGS" \
		prefix="$PREFIX" \
		mandir="$PREFIX/share/man" \
		CONFIG_ARTS=n \
		CONFIG_CDDB=n \
		CONFIG_CDIO=n \
		CONFIG_DISCID=n \
		CONFIG_FLAC=n \
		CONFIG_MAD=n \
		CONFIG_MODPLUG=n \
		CONFIG_MIKMOD=n \
		CONFIG_MPC=n \
		CONFIG_VORBIS=n \
		CONFIG_TREMOR=n \
		CONFIG_WAV=n \
		CONFIG_WAVPACK=n \
		CONFIG_MP4=n \
		CONFIG_AAC=n \
		CONFIG_FFMPEG=n \
		CONFIG_CUE=n \
		CONFIG_ROAR=n \
		CONFIG_PULSE=n \
		CONFIG_ALSA=n \
		CONFIG_AO=n \
		CONFIG_ARTS=n \
		CONFIG_OSS=n \
		CONFIG_SUN=n \
		CONFIG_WAVEOUT=n \
		USE_FALLBACK_IP=n
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
