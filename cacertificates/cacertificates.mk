# make deps: run-parts (busybox has this).
TARG = cacertificates

<$mkbuild/mk.common-noinst

cacertificates:QV:
	cp ../certdata2pem.c mozilla/
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
	$INSTALL -d -m 755 "$ROOT/etc/ssl/certs"
	( cd "$ROOT/share/ca-certificates/"; \
	  find . -name '*.crt' | sort | cut -b3- > "$ROOT/etc/ca-certificates.conf" )
	cp sbin/update-ca-certificates .
	sed -e 's#=/etc/#=${DESTDIR}/etc/#' -i update-ca-certificates
	sed -e 's#=/share/#=${DESTDIR}/share/#' -i update-ca-certificates
	sed -e 's#=/local/#=${DESTDIR}/local/#' -i update-ca-certificates
	# create dir update.d, called in script update-ca-certificates.
	$INSTALL -d -m 755 "$ROOT/etc/ca-certificates/update.d"
	DESTDIR="$ROOT" sh ./update-ca-certificates --fresh
