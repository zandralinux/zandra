<config.mk

allpkgs = `{ls pkgs/*}
pkgs = ${allpkgs:pkgs/%=%}

help:VQ:
	echo 'Usage: mk <pkg>'
	echo '\nTo build all the targets in pkgs/, run `mk world´'

all world:VQ: $pkgs

clean:V:
	rm -f .state/*

# generate a pkgs.mk file with the tarkets for all packages in pkgs/
`{ mkdir -p .state }
`{ echo '# auto-generated file, do not edit' > pkgs.mk }
`{ cd pkgs && for pkg in *; do cat $pkg | sed -e "s,^build:,$pkg:QP./stuff/cmp-pkgs: pkgs/$pkg," >> ../pkgs.mk && echo '\tcd $top && cp pkgs/$target .state/$target\n' >> ../pkgs.mk; done }

<pkgs.mk

bootable:V:
	stuff/create-bootable "$root" morpheus-$arch-$version.img

