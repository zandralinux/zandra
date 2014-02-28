<config.mk

allpkgs = `{ls pkgs/*}
pkgs = ${allpkgs:pkgs/%=%}

help:VQ:
	echo 'Usage: mk <pkg>'
	echo '\nTo build all the targets in pkgs/, run `mk world´'

all world:VQ: $pkgs

clean:V:
	rm -f .state/* pkgs.mk

fetchpkgs = ${pkgs:%=%-fetch}

fetch-all fetch-world:VQ: ${fetchpkgs}

# generate a pkgs.mk file with the tarkets for all packages in pkgs/
`{ mkdir -p src }
`{ mkdir -p .state }
`{ echo '# auto-generated file, do not edit' > pkgs.mk }
`{ cd pkgs && for pkg in *; do cat $pkg ../stuff/fetch-pkg.mk |\
	sed -e "s,^build:,$pkg:QP./stuff/cmp-pkgs: $pkg-fetch pkgs/$pkg," |\
	sed -e "s,^fetch-target:,$pkg-fetch:," |\
	sed -e "s,^v=,${pkg}_v=," |\
	sed -e "s,\$v,\${${pkg}_v}," |\
	sed -e "s,\$url,\${${pkg}_url}," |\
	sed -e "s, url=, ${pkg}_url=," |\
	sed -e "s,\$git,\${${pkg}_git}," |\
	sed -e "s,^git=,${pkg}_git=," |\
	sed -e "s,^url=,${pkg}_url=," >> ../pkgs.mk; done }

<pkgs.mk

test:VQ:
	echo test

bootable:V:
	stuff/create-bootable "$root" morpheus-$arch-$version.img
