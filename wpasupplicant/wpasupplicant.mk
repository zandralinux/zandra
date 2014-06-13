TARG = wpasupplicant
DEPS = openssl libnl3 zlib

<$mkbuild/mk.common

INSTALL_BIN = \
	wpa_supplicant/wpa_supplicant \
	wpa_supplicant/wpa_cli \
	wpa_supplicant/wpa_passphrase

INSTALL_MAN8 = wpa_supplicant/doc/docbook/wpa_supplicant.8

wpasupplicant:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# patch linux_wext.h (may use -D instead).
	sed -i 's/typedef __/typedef /g' src/drivers/linux_wext.h
	cp ../dot.config wpa_supplicant/.config
	# add -lz as extra libs.
	make -j$nprocs -C wpa_supplicant EXTRALIBS="-lz"
