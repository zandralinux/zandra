#!/bin/sh

f=`pwd`/`dirname $0`
p=$1

printf '# auto-generated file, do not edit\n'

cd $p

for pkg in *; do
	deps=$(cat $pkg/build | sed -e 'N;s,\\\n, ,' | grep ^build: | cut -d ':' -f 2-)
	fdeps=`for d in $deps; do echo -n "$d-fetch "; done`
	cat $pkg/build $f/fetch-pkg.mk |
		sed -e "s,^build:,$pkg:QP${f}/cmp-pkgs: $pkg-fetch `pwd`/$pkg/build," \
		-e "s,^fetch-target:,$pkg-fetch:QP${f}/cmp-fetch: $fdeps," \
		-e "s,^v=,_${pkg}_v=," \
		-e "s,^pkgdir=,_${pkg}_pkgdir=`pwd`/$pkg," \
		-e "s,\$v,\${_${pkg}_v},g" \
		-e "s,\$pkgdir,\${_${pkg}_pkgdir},g" \
		-e "s,\$url,\${_${pkg}_url},g" \
		-e "s, url=, _${pkg}_url=,g" \
		-e "s,\$git,\${_${pkg}_git},g" \
		-e "s,^git=,_${pkg}_git=," \
		-e "s,^url=,_${pkg}_url=,"

	echo
done
