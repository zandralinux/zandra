<$curl_DEPDIR/v.mk

curl_includedir = $curl_DEPDIR/curl-$v/include
curl_libdir = $curl_DEPDIR/curl-$v/lib/.libs
DEPS_CFLAGS = $DEPS_CFLAGS -I$curl_includedir -DCURL_STATICLIB
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$curl_libdir -lcurl
