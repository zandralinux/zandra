TARG = cacertificates

<$mkbuild/mk.common-noinst

cacertificates:QV:
	patch -p1 -N --silent --dry-run < ../ca-certificates.patch &&
		patch -p1 -N < ../ca-certificates.patch
	cp ../certdata2pem.c mozilla/
	cp ../mozilla_Makefile mozilla/Makefile
	make

install:QV:
	make DESTDIR="$ROOT" install
	mkdir -p "$ROOT/etc/ssl/certs"
	( cd "$ROOT/share/ca-certificates/"
	  find . -name '*.crt' | sort | cut -b3- > "$ROOT/etc/ca-certificates.conf" )
	cp sbin/update-ca-certificates .
	sed -e 's#=/etc/#=${DESTDIR}/etc/#' -i update-ca-certificates
	sed -e 's#=/share/#=${DESTDIR}/share/#' -i update-ca-certificates
	sed -e 's#=/local/#=${DESTDIR}/local/#' -i update-ca-certificates
	# create dir update.d, called in script update-ca-certificates.
	mkdir -p "$ROOT/etc/ca-certificates/update.d"
	DESTDIR="$ROOT" sh ./update-ca-certificates --fresh
