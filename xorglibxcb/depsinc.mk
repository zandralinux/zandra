<$xorglibxcb_DEPDIR/v.mk

xorglibxcb_libdir = ${xorglibxcb_DEPDIR}/libxcb-$v/lib/lib/
xorglibxcb_includedir = ${xorglibxcb_DEPDIR}/libxcb-$v/lib/include/

xorglibxcb_CFLAGS = -I${xorglibxcb_includedir}
xorglibxcb_LDFLAGS = -L${xorglibxcb_libdir} -lxcb

DEPS_CFLAGS = $DEPS_CFLAGS ${xorglibxcb_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${xorglibxcb_LDFLAGS}
# -lxcb-composite -lxcb-damage -lxcb-dpms -lxcb-dri2 -lxcb-dri3 -lxcb-glx -lxcb-present -lxcb-randr -lxcb-record -lxcb-render -lxcb-res -lxcb-screensaver -lxcb-shape -lxcb-shm -lxcb-sync -lxcb-xevie -lxcb-xf86dri -lxcb-xfixes -lxcb-xinerama -lxcb-xkb -lxcb-xprint -lxcb-xtest -lxcb-xv -lxcb-xvmc
