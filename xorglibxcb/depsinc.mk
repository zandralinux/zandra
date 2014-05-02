<$xorglibxcb_DEPDIR/v.mk

xorglibxcb_libdir = ${xorglibxcb_DEPDIR}/libxcb-$v/lib/lib/
xorglibxcb_includedir = ${xorglibxcb_DEPDIR}/libxcb-$v/lib/include/

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxcb_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxcb_libdir} -lxcb 
# -lxcb-composite -lxcb-damage -lxcb-dpms -lxcb-dri2 -lxcb-dri3 -lxcb-glx -lxcb-present -lxcb-randr -lxcb-record -lxcb-render -lxcb-res -lxcb-screensaver -lxcb-shape -lxcb-shm -lxcb-sync -lxcb-xevie -lxcb-xf86dri -lxcb-xfixes -lxcb-xinerama -lxcb-xkb -lxcb-xprint -lxcb-xtest -lxcb-xv -lxcb-xvmc
