top = `{pwd}
`{ test -e config.mk || cp config.def.mk config.mk }
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
	rm -rf ${root}

fetchpkgs = ${pkgs:%=%-fetch}

fetch-all fetch-world:VQ: ${fetchpkgs}

`{ mkdir -p src }
`{ mkdir -p .cache }

# generate a pkgs.mk file with the targets for all packages in pkgs/
`{ stuff/generate-pkgs.sh pkgs > pkgs.mk }

<pkgs.mk

bootable:V:
	stuff/create-bootable "$root" morpheus-$arch-$version.img
