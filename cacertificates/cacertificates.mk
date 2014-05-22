# make deps: run-parts (busybox has this).
TARG = cacertificates

<$mkbuild/mk.common-noinst

$TARG:QV:
	# patch all the things.
	patch -p1 -N --silent --dry-run < ../ca-certificates.patch &&
		patch -p1 -N < ../ca-certificates.patch
	make -j$nprocs

install:QV:
	# patch all the things.
	patch -p1 -N --silent --dry-run < ../ca-certificates.patch &&
		patch -p1 -N < ../ca-certificates.patch
	make -j$nprocs DESTDIR="$ROOT" install
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
