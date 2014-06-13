TARG = wpasupplicant
DEPS = zlib openssl libnl3

<$mkbuild/mk.common

INSTALL_BIN = wpa_supplicant/wpa_supplicant
# wpa_supplicant/wpa_cli wpa_supplicant/wpa_passphrase are also built

INSTALL_MAN8 = wpa_supplicant/doc/docbook/wpa_supplicant.8
# INSTALL_MAN8 = `{ ls wpa_supplicant/doc/docbook/*.8 }

wpasupplicant:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# patch linux_wext.h (may use -D instead).
	sed -i 's/typedef __/typedef /g' src/drivers/linux_wext.h
	#sed -i &#39;s/typedef __/typedef /g&#39; src/drivers/linux_wext.h
	cp ../dot.config wpa_supplicant/.config
	# -lz at the right place.
	sed -i '/^wpa_supplicant:/{N;s/$/ -lz/}' wpa_supplicant/Makefile
	#sed -i &#39;/^wpa_supplicant:/{N;s/$/ -lz/}&#39; wpa_supplicant/Makefile
	make -j$nprocs -C wpa_supplicant
