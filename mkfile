<config.mk

allpkgs = `{ls -d pkgs/*}
pkgs = ${allpkgs:pkgs/%=%}

help:VQ:
	printf 'Usage: mk pkg...\n'
	printf '\nTo build all the targets in pkgs/, run `mk world´\n'

all world:VQ: $pkgs

clean:V:
	rm -f .cache/* pkgs.mk

clean-all clean-world:V: clean
	rm -rf ${root} src

fetchpkgs = ${pkgs:%=%-fetch}

fetch-all fetch-world:VQ: ${fetchpkgs}

# generate a pkgs.mk file with the targets for all packages in pkgs/
`{ mkdir -p src }
`{ mkdir -p .cache }
`{ printf '# auto-generated file, do not edit\n' > pkgs.mk }
`{ cd pkgs && for pkg in *; do cat $pkg/build ../stuff/fetch-pkg.mk |\
	sed -e "s,^build:,$pkg:QP./stuff/cmp-pkgs: $pkg-fetch pkgs/$pkg/build," |\
	sed -e "s,^fetch-target:,$pkg-fetch:," |\
	sed -e "s,^v=,_${pkg}_v=," |\
	sed -e "s,^pkgdir=,_${pkg}_pkgdir=$top/pkgs/$pkg," |\
	sed -e "s,\$v,\${_${pkg}_v},g" |\
	sed -e "s,\$pkgdir,\${_${pkg}_pkgdir},g" |\
	sed -e "s,\$url,\${_${pkg}_url},g" |\
	sed -e "s, url=, _${pkg}_url=,g" |\
	sed -e "s,\$git,\${_${pkg}_git},g" |\
	sed -e "s,^git=,_${pkg}_git=," |\
	sed -e "s,^url=,_${pkg}_url=," >> ../pkgs.mk; \
	echo >> ../pkgs.mk; done }

<pkgs.mk

bootable:V:
	stuff/create-bootable "$root" morpheus-$arch-$version.img
