- Rust version: `rustc 1.48.0-nightly (0d0f6b113 2020-09-03)`
- OS: NixOS unstable, kernel 5.7.16
- NDK version: `18.1.5063045`

```
export TARGET_CC=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc               
export TARGET_AR=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar
export CC_AARCH64_LINUX_ANDROID=$TARGET_CC
export AR_AARCH64_LINUX_ANDROID=$TARGET_AR
export CARGO_TARGET_AR_AARCH64_LINUX_ANDROID_LINKER=$TARGET_CC
export CARGO_TARGET_AR_AARCH64_LINUX_ANDROID_AR=$TARGET_AR
```

Building fails with:

```
❯ cargo build --target aarch64-linux-android
   Compiling ring v0.16.15
   Compiling http-body v0.3.1
   Compiling mio v0.6.22
   Compiling url v2.1.1
   Compiling syn v1.0.39
   Compiling indexmap v1.5.2
   Compiling mime_guess v2.0.3
   Compiling tokio v0.2.22
   Compiling serde_urlencoded v0.6.1
error: failed to run custom build command for `ring v0.16.15`

Caused by:
  process didn't exit successfully: `/home/little-dude/code/cross-compile-reqwest/target/debug/build/ring-ca64f0e328c4a008/build-script-build` (exit code: 101)
  --- stdout
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")
  OPT_LEVEL = Some("0")
  TARGET = Some("aarch64-linux-android")
  HOST = Some("x86_64-unknown-linux-gnu")
  CC_aarch64-linux-android = None
  CC_aarch64_linux_android = None
  TARGET_CC = Some("/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc")
  CFLAGS_aarch64-linux-android = None
  CFLAGS_aarch64_linux_android = None
  TARGET_CFLAGS = None
  CFLAGS = None
  CRATE_CC_NO_DEFAULTS = None
  DEBUG = Some("true")
  CARGO_CFG_TARGET_FEATURE = Some("fp,neon")

  --- stderr
  ENV AR=ar
  ENV AR_AARCH64_LINUX_ANDROID=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar
  ENV AS=as
  ENV BASH_ENV=/home/little-dude/.cache/lorri/cas/4eb9c96701a2b2d592e6ff1f51327352
  ENV CARGO=/nix/store/bsy3awrl54nm4qrxfl3kd645qpr8f1x4-rust/bin/cargo
  ENV CARGO_CFG_TARGET_ARCH=aarch64
  ENV CARGO_CFG_TARGET_ENDIAN=little
  ENV CARGO_CFG_TARGET_ENV=
  ENV CARGO_CFG_TARGET_FAMILY=unix
  ENV CARGO_CFG_TARGET_FEATURE=fp,neon
  ENV CARGO_CFG_TARGET_HAS_ATOMIC=128,16,32,64,8,ptr
  ENV CARGO_CFG_TARGET_HAS_ATOMIC_LOAD_STORE=128,16,32,64,8,ptr
  ENV CARGO_CFG_TARGET_OS=android
  ENV CARGO_CFG_TARGET_POINTER_WIDTH=64
  ENV CARGO_CFG_TARGET_VENDOR=unknown
  ENV CARGO_CFG_UNIX=
  ENV CARGO_FEATURE_ALLOC=1
  ENV CARGO_FEATURE_DEFAULT=1
  ENV CARGO_FEATURE_DEV_URANDOM_FALLBACK=1
  ENV CARGO_FEATURE_ONCE_CELL=1
  ENV CARGO_MAKEFLAGS=--jobserver-fds=5,6 -j --jobserver-auth=5,6 -j
  ENV CARGO_MANIFEST_DIR=/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15
  ENV CARGO_MANIFEST_LINKS=ring-asm
  ENV CARGO_PKG_AUTHORS=Brian Smith <brian@briansmith.org>
  ENV CARGO_PKG_DESCRIPTION=Safe, fast, small crypto using Rust.
  ENV CARGO_PKG_HOMEPAGE=
  ENV CARGO_PKG_LICENSE=
  ENV CARGO_PKG_LICENSE_FILE=LICENSE
  ENV CARGO_PKG_NAME=ring
  ENV CARGO_PKG_REPOSITORY=https://github.com/briansmith/ring
  ENV CARGO_PKG_VERSION=0.16.15
  ENV CARGO_PKG_VERSION_MAJOR=0
  ENV CARGO_PKG_VERSION_MINOR=16
  ENV CARGO_PKG_VERSION_PATCH=15
  ENV CARGO_PKG_VERSION_PRE=
  ENV CARGO_TARGET_AR_AARCH64_LINUX_ANDROID_AR=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar
  ENV CARGO_TARGET_AR_AARCH64_LINUX_ANDROID_LINKER=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc
  ENV CC=gcc
  ENV CC_AARCH64_LINUX_ANDROID=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc
  ENV COLORTERM=truecolor
  ENV CONFIG_SHELL=/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin/bash
  ENV CUPS_DATADIR=/nix/store/ffh486hp66fk38282sb6bvqvj3lhw93l-cups-progs/share/cups
  ENV CXX=g++
  ENV DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
  ENV DEBUG=true
  ENV DESKTOP_SESSION=gnome
  ENV DIRENV_DIFF=eJzsmN9v4zYSx_8XPy9lUpRIKW9uEzfOZr1JnGyyeTEkSiIpUTQl6ieL_u8HN93uXbwH9HAPBQq_2IKgz8xwNJrvYH5dmMXFr4u71eP14mKx1HJa2u7Q5ss6mXmIIouwIHweWgKhhjpEmI8EjRYDk3RM5KoA0ENomUp98W-071pDI0ISRx0aU9PwLFFhEorQhU0yJoAzBsY2MSZvQexhD763EGJCCuWqUhibjjRyddbGzIcpdWUZxPXvFn5I1hIqMhsfZzGGBcnKQvqZM5hgrlpfVYArmTLgexiBVOr3OM-wVkQwFtWuiYp6ygZFmBNYQR2oJATs0OZ9J5UFkYdPTj5LWmqjRRhFaROlpoB8kty5ETVVmDXl0eUb_e34x0C8EzsoaWPO6kFWWYVGWUI2BoUeBxVKSBOOvtv5MT_IEtZoMGUxMVGM5awtRYmZE1pyn8oMJDprDzKzWXWSehM65RgVGCdpEAwjaYoYMei7onAoS4DOKpD2OlM5QJGHvBASDIPwvR3hxqYUBCuHx2iQRchK5idhySxmmZ7SbyEA2_WZPADbJanKQeBBD52-1tQ0BpdZxXEYyUZYETcGp2lE_HCOlTOg7W0HkBdEHgRactGpGfjQhwDGAGIAM1iQFCH83nCSRtWkHDFVMvqNtlUj6laJtMkiUza4AoXU2VuqA4-eBjY1lZvGdMBUWziWHJu4LKYSpkEbk8ynIJNF8cZjj76nW-UXrRuHmCuSwmJKW1gnQ4D9IhJksBhw3ds8A4EXnaBRqaAeStU4kdUiHHTRNoUugpjwqpzpEeVtbgD2gpMyDQoyGmyiUWIYKDoFNBVB01BXhKwpLeDJWIHwRy9iTFlsYeGzDM5NG1BX1iIOVArxPNLQZke3XdIC5GH_Pav9VsApG3xieIBCWlqthlQLMlclFC0H3EkDkIdOvFYTG8smsFkoZcNlY3DsGhsY5lIk_aoEqZPGB8iDHjkW0I8-7YIIRKtZ-xHG2ASNluOYalYnuG5NY6Jj5HVSHUvwpEoIxZQ1sR5MUIUthQ3jBUEQBi1UPscDSBMrQOAFwPgn8OSLsiGajD6j2QRDVMVyHGYOAycxK6q3Zgp8j3rkPauoGinilAg1oyIkth6cwBhFIVU8GSIwORB6vhd-P3Hb6-Uf3cW-3RGHOl8q2XUqB1mf5UtPywmY9lBIlb89knds-ccNuzz2pd7m7X8wfwY2JO3v_38-nuVF0qvuu3fWt22uO2Bn2-X10o7_LQx20IXkS2fF0qieS22P18DOuksmICQX6vgpS83_Im0OY96qfMgVgtX_4DHpu4PtOc9tJw_aLn77sNBHZbzcPFxtv-wvNw-LiwU4tccOx5_2YC1gh9pIlYM2b8bcdosP3-Dn1ePP11e7xcUiv5mfymjdELe6fyjiNZnvy3KHb-ch6K7xQ7ET4iZA5qlT5uaRN2qPgo9kl6zvy6-XqzBzFOvoarV_etVXT58-5-sNe3m-6veXayGifRkoRFucv9RbWeRrPIfsl2kK7h7YkPU3-0sJ-9tN-PE5sDv6ldMoj2Kk0rV9fd7e4Wy__WnaxWbHnbr_ei_nSB_Wu1kw_tmZK1hRVJbi62esFFuVl2Q1S1QFZQ2r5Pojd3ePn6RlX8zP_T256WmvvyT-Ok0__vS6e7pSm_7macNfhhvSbOs9u7Xrj_WzQnd5kA8b9xJf3-3Vw5yKL5A6-6nrwTaqEwgP_uM13PDt7heCm7q42e5en5zJhjj2dW56-krAiq9W-_3-9SE82MWHxWa7325e9rvrq9vbxcVC1qZv88WH83jzjxtv_t4snIervzpc_Z-JPs9m59nsnzWbnSXoLEFnCTpL0FmCzhJ0lqCzBJ2XvOcl77mLn7v4ecn7dyx5f_tXAAAA__82be_5
  ENV DIRENV_DIR=-/home/little-dude/code/cross-compile-reqwest
  ENV DIRENV_WATCHES=eJyUj8Fq6zAQRf9F6yQjjS3Lyv4tH3RfShhJ41pUtlpJTgql_14K6SaFQjYDA5dz73n8EA_UZnEUMOeFIcXWEu_DFhh8_j4l17r3eXmNifeF3y5cGxx4PRcvduJ_Di0uLI5KW4sS7Yg78e891lbFsZWNP3d_NBxS9pSgzlQYQiy8noFSyhcgOzpE0k71jjhYO3llcAjD6Ayi1k4jm0kaHKgzPTMiscVpCuQ6Ju7unVa2FbbKBZSUElIuJUIgXvJ6qNm_cLsFKmWl1Pe4evIzX9HP_lRybhV07zsMtu-N8ma00o2TH0IgNSG63qmfJNSZUzpdv992nepu7Z6-AgAA___ZR5os
  ENV DISPLAY=:1
  ENV EDITOR=nano
  ENV GDK_PIXBUF_MODULE_FILE=/nix/store/jnh4f7lx595n582mx31qv9pw0zd5vrqv-librsvg-2.48.8/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache
  ENV GDMSESSION=gnome
  ENV GDM_LANG=en_US.UTF-8
  ENV GDM_X_SERVER_EXTRA_ARGS=-config /nix/store/zszfvwz7j7c6ifjavah8nqarqa8gwkr4-xserver.conf -xkbdir /nix/store/a5vimrwkhp2v00r37b7glllp9mfxq6b1-xkeyboard-config-2.27/etc/X11/xkb -logfile /dev/null -nolisten tcp
  ENV GIO_EXTRA_MODULES=/nix/store/li7vgcymj8y0l3x2cqpv8x3wx554jmbp-dconf-0.36.0-lib/lib/gio/modules:/nix/store/li7vgcymj8y0l3x2cqpv8x3wx554jmbp-dconf-0.36.0-lib/lib/gio/modules:/nix/store/rp6v8n9pd99kvlgmpy48d73gjw3jf24k-glib-networking-2.64.3/lib/gio/modules:/nix/store/li7vgcymj8y0l3x2cqpv8x3wx554jmbp-dconf-0.36.0-lib/lib/gio/modules:/nix/store/rp6v8n9pd99kvlgmpy48d73gjw3jf24k-glib-networking-2.64.3/lib/gio/modules:/nix/store/li7vgcymj8y0l3x2cqpv8x3wx554jmbp-dconf-0.36.0-lib/lib/gio/modules:/nix/store/rp6v8n9pd99kvlgmpy48d73gjw3jf24k-glib-networking-2.64.3/lib/gio/modules:/nix/store/s5h2qwv1aw5x881fdli4mvadldzmcaa3-gvfs-1.44.1/lib/gio/modules:/nix/store/li7vgcymj8y0l3x2cqpv8x3wx554jmbp-dconf-0.36.0-lib/lib/gio/modules
  ENV GI_TYPELIB_PATH=/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/lib/girepository-1.0:/nix/store/jnh4f7lx595n582mx31qv9pw0zd5vrqv-librsvg-2.48.8/lib/girepository-1.0:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/lib/girepository-1.0:/nix/store/17m4xwywi3v2smafq98mzla3jippnqp9-atk-2.36.0/lib/girepository-1.0:/nix/store/awfrddgfpv76s64fcsrjk64lnmkwgll5-gdk-pixbuf-2.40.0/lib/girepository-1.0:/nix/store/zlpl17p3aq9a0x1nkxkp4bb1q949kl22-harfbuzz-2.6.7/lib/girepository-1.0:/nix/store/xwpjpc5ypbqpn9p0ir2dv6sp87aj772m-pango-1.45.3/lib/girepository-1.0:/nix/store/74vj73dva1q9ym5y0gsb118ai7d4z1za-gcr-3.36.0/lib/girepository-1.0:/nix/store/4l2kd63bi75l6kg9n1s39m6gd8xfv25h-accountsservice-0.6.55/lib/girepository-1.0:/nix/store/k8q0kyyw0f7dchwhayrxijpampwxfhs6-libsecret-0.20.3/lib/girepository-1.0:/nix/store/4zkyhlhi0v7ld733kv2ig2lnnndk79ja-polkit-0.116/lib/girepository-1.0:/nix/store/v960kcdp9fmb8jgzz2z6fl4qsah3raf3-network-manager-1.26.0/lib/girepository-1.0:/nix/store/qjyjr4gll6l6s4qc2vgllm3y2rsbg4vv-telepathy-glib-0.24.1/lib/girepository-1.0:/nix/store/kbsg91jgmi61mcr7pywrz85r5sbzssqc-json-glib-1.4.4/lib/girepository-1.0:/nix/store/gvmyakf0v1wjp7q9iv4dm4qirpw8jh8k-graphene-1.10.2/lib/girepository-1.0:/nix/store/0y6rhl43axj7ym1x82jr0j338yh16ysr-libical-3.0.8/lib/girepository-1.0:/nix/store/h5q0dj39gqp58h6mvsmb5bvbyd3vdghn-libsoup-2.70.0/lib/girepository-1.0:/nix/store/8bbbsvawdzall3d2a7flgry47ax7q4qg-evolution-data-server-3.36.5/lib/girepository-1.0:/nix/store/0d868l70nqj216hkzfyk6921n7732js3-gdm-3.34.1/lib/girepository-1.0:/nix/store/7vagjvd1nwhmd9agf3n6hjxs1saksakc-geoclue-2.5.6/lib/girepository-1.0:/nix/store/bv51lr6zd7q0xk374fwwbxlpj5zncfm8-gnome-bluetooth-3.34.1/lib/girepository-1.0:/nix/store/qv4gvcs0r00hap6834vb9w8kanyfgkj7-at-spi2-core-2.36.0/lib/girepository-1.0:/nix/store/pbgsz2fwnhdq9kngywlv24almc2ia8vg-upower-0.99.11/lib/girepository-1.0:/nix/store/h5xxlyb1n6lvl3282wjssq99f5awvs9i-ibus-1.5.22/lib/girepository-1.0:/nix/store/14da9ikdagdlgn76dbz6i28v6d2y7vk9-gnome-desktop-3.36.4/lib/girepository-1.0:/nix/store/x5md2m837h2fjg1nxf3w8c3yi9rms9z0-telepathy-logger-0.8.2/lib/girepository-1.0:/nix/store/3q9732byyd8hmwhlba1qc9gdnfl7lp20-gobject-introspection-1.64.1/lib/girepository-1.0:/nix/store/j94jcak5d182sjnvz7j4r2kw9irq2857-gstreamer-1.16.2/lib/girepository-1.0:/nix/store/p20m5gj8pf9zld2qls0v7q9c8dm22zy4-gst-plugins-base-1.16.2/lib/girepository-1.0:/nix/store/5mw636h1ryinh248a7mlsvdflr10hg71-libgweather-3.36.1/lib/girepository-1.0:/nix/store/mjwnj3zdp7dx6p6wrhcv0fqydx2xvr3w-libnma-1.8.30/lib/girepository-1.0:/nix/store/kcxb799jgykl2immk71g3c49n3f13289-gnome-autoar-0.2.4/lib/girepository-1.0:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/lib/girepository-1.0:/nix/store/jnh4f7lx595n582mx31qv9pw0zd5vrqv-librsvg-2.48.8/lib/girepository-1.0:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/lib/girepository-1.0:/nix/store/17m4xwywi3v2smafq98mzla3jippnqp9-atk-2.36.0/lib/girepository-1.0:/nix/store/awfrddgfpv76s64fcsrjk64lnmkwgll5-gdk-pixbuf-2.40.0/lib/girepository-1.0:/nix/store/zlpl17p3aq9a0x1nkxkp4bb1q949kl22-harfbuzz-2.6.7/lib/girepository-1.0:/nix/store/xwpjpc5ypbqpn9p0ir2dv6sp87aj772m-pango-1.45.3/lib/girepository-1.0:/nix/store/74vj73dva1q9ym5y0gsb118ai7d4z1za-gcr-3.36.0/lib/girepository-1.0:/nix/store/4l2kd63bi75l6kg9n1s39m6gd8xfv25h-accountsservice-0.6.55/lib/girepository-1.0:/nix/store/k8q0kyyw0f7dchwhayrxijpampwxfhs6-libsecret-0.20.3/lib/girepository-1.0:/nix/store/4zkyhlhi0v7ld733kv2ig2lnnndk79ja-polkit-0.116/lib/girepository-1.0:/nix/store/v960kcdp9fmb8jgzz2z6fl4qsah3raf3-network-manager-1.26.0/lib/girepository-1.0:/nix/store/qjyjr4gll6l6s4qc2vgllm3y2rsbg4vv-telepathy-glib-0.24.1/lib/girepository-1.0:/nix/store/kbsg91jgmi61mcr7pywrz85r5sbzssqc-json-glib-1.4.4/lib/girepository-1.0:/nix/store/gvmyakf0v1wjp7q9iv4dm4qirpw8jh8k-graphene-1.10.2/lib/girepository-1.0:/nix/store/0y6rhl43axj7ym1x82jr0j338yh16ysr-libical-3.0.8/lib/girepository-1.0:/nix/store/h5q0dj39gqp58h6mvsmb5bvbyd3vdghn-libsoup-2.70.0/lib/girepository-1.0:/nix/store/8bbbsvawdzall3d2a7flgry47ax7q4qg-evolution-data-server-3.36.5/lib/girepository-1.0:/nix/store/0d868l70nqj216hkzfyk6921n7732js3-gdm-3.34.1/lib/girepository-1.0:/nix/store/7vagjvd1nwhmd9agf3n6hjxs1saksakc-geoclue-2.5.6/lib/girepository-1.0:/nix/store/bv51lr6zd7q0xk374fwwbxlpj5zncfm8-gnome-bluetooth-3.34.1/lib/girepository-1.0:/nix/store/qv4gvcs0r00hap6834vb9w8kanyfgkj7-at-spi2-core-2.36.0/lib/girepository-1.0:/nix/store/pbgsz2fwnhdq9kngywlv24almc2ia8vg-upower-0.99.11/lib/girepository-1.0:/nix/store/h5xxlyb1n6lvl3282wjssq99f5awvs9i-ibus-1.5.22/lib/girepository-1.0:/nix/store/14da9ikdagdlgn76dbz6i28v6d2y7vk9-gnome-desktop-3.36.4/lib/girepository-1.0:/nix/store/x5md2m837h2fjg1nxf3w8c3yi9rms9z0-telepathy-logger-0.8.2/lib/girepository-1.0:/nix/store/3q9732byyd8hmwhlba1qc9gdnfl7lp20-gobject-introspection-1.64.1/lib/girepository-1.0:/nix/store/j94jcak5d182sjnvz7j4r2kw9irq2857-gstreamer-1.16.2/lib/girepository-1.0:/nix/store/p20m5gj8pf9zld2qls0v7q9c8dm22zy4-gst-plugins-base-1.16.2/lib/girepository-1.0:/nix/store/5mw636h1ryinh248a7mlsvdflr10hg71-libgweather-3.36.1/lib/girepository-1.0:/nix/store/mjwnj3zdp7dx6p6wrhcv0fqydx2xvr3w-libnma-1.8.30/lib/girepository-1.0:/nix/store/kcxb799jgykl2immk71g3c49n3f13289-gnome-autoar-0.2.4/lib/girepository-1.0
  ENV GJS_DEBUG_OUTPUT=stderr
  ENV GJS_DEBUG_TOPICS=JS ERROR;JS LOG
  ENV GNOME_TERMINAL_SCREEN=/org/gnome/Terminal/screen/f4b5422c_3a1a_4267_9db9_e57a03d24bec
  ENV GNOME_TERMINAL_SERVICE=:1.154
  ENV GST_PLUGIN_SYSTEM_PATH_1_0=/nix/store/j94jcak5d182sjnvz7j4r2kw9irq2857-gstreamer-1.16.2/lib/gstreamer-1.0:/nix/store/p20m5gj8pf9zld2qls0v7q9c8dm22zy4-gst-plugins-base-1.16.2/lib/gstreamer-1.0:/nix/store/qg0na96dm5xp6ys2zx0ivclapqipap8v-gst-plugins-good-1.16.2/lib/gstreamer-1.0:/nix/store/j94jcak5d182sjnvz7j4r2kw9irq2857-gstreamer-1.16.2/lib/gstreamer-1.0:/nix/store/p20m5gj8pf9zld2qls0v7q9c8dm22zy4-gst-plugins-base-1.16.2/lib/gstreamer-1.0:/nix/store/qg0na96dm5xp6ys2zx0ivclapqipap8v-gst-plugins-good-1.16.2/lib/gstreamer-1.0
  ENV GTK_PATH=/home/little-dude/.nix-profile/lib/gtk-2.0:/home/little-dude/.nix-profile/lib/gtk-3.0:/etc/profiles/per-user/little-dude/lib/gtk-2.0:/etc/profiles/per-user/little-dude/lib/gtk-3.0:/nix/var/nix/profiles/default/lib/gtk-2.0:/nix/var/nix/profiles/default/lib/gtk-3.0:/run/current-system/sw/lib/gtk-2.0:/run/current-system/sw/lib/gtk-3.0
  ENV HOME=/home/little-dude
  ENV HOST=x86_64-unknown-linux-gnu
  ENV HOST_PATH=/nix/store/vij0m1vpjfxchfwjyns71apya7jg27id-androidsdk/bin:/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/bin:/nix/store/hzwqjh63lz3w8vif5cjc2a5jcs3cdnxb-android-studio-stable-4.0.1.0/bin:/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/ab8kxlz6pkaw2qnskqhmrlhbqd8pjq3k-findutils-4.7.0/bin:/nix/store/xqkzxwbv37ns0wjg3p9jfxj0b4r96d27-diffutils-3.7/bin:/nix/store/rl2frzwv9gl6b0fxbr0mav432f8h6vs3-gnused-4.8/bin:/nix/store/r8jl0nvjlqzhdmh5vnfrqfnf496gkjy7-gnugrep-3.4/bin:/nix/store/y4f6wp3p8wi304l7x47bh4qq7zf5cqjs-gawk-5.1.0/bin:/nix/store/wbc9s0f2cd0yqr47zjmh94lb03yw75sd-gnutar-1.32/bin:/nix/store/n2rh0xdv26pg4157jsnlvbnh6ykj0hrg-gzip-1.10/bin:/nix/store/kxcwjq4sd5iiqgiqp39zqs4pczb1i2kj-bzip2-1.0.6.0.1-bin/bin:/nix/store/f6h17kyn28333p4qniwwbncma3mrpqp8-gnumake-4.3/bin:/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin:/nix/store/x2hjq6n6w2c7dx051k9iwvyg04zi3cfk-patch-2.7.6/bin:/nix/store/l7lw71g76hly1f56smvzh331857lgav8-xz-5.2.5-bin/bin
  ENV INFOPATH=/home/little-dude/.nix-profile/info:/home/little-dude/.nix-profile/share/info:/etc/profiles/per-user/little-dude/info:/etc/profiles/per-user/little-dude/share/info:/nix/var/nix/profiles/default/info:/nix/var/nix/profiles/default/share/info:/run/current-system/sw/info:/run/current-system/sw/share/info
  ENV INVOCATION_ID=a529db735fbf4df9bd36977c0c22cac3
  ENV IN_LORRI_SHELL=/home/little-dude/code/cross-compile-reqwest/shell.nix
  ENV IN_NIX_SHELL=impure
  ENV JOURNAL_STREAM=8:46842
  ENV KDEDIRS=/home/little-dude/.nix-profile:/etc/profiles/per-user/little-dude:/nix/var/nix/profiles/default:/run/current-system/sw
  ENV LANG=en_US.UTF-8
  ENV LD=ld
  ENV LD_LIBRARY_PATH=/home/little-dude/code/cross-compile-reqwest/target/debug/deps:/home/little-dude/code/cross-compile-reqwest/target/debug:/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/x86_64-unknown-linux-gnu/lib
  ENV LIBEXEC_PATH=/home/little-dude/.nix-profile/lib/libexec:/etc/profiles/per-user/little-dude/lib/libexec:/nix/var/nix/profiles/default/lib/libexec:/run/current-system/sw/lib/libexec
  ENV LOCALE_ARCHIVE=/run/current-system/sw/lib/locale/locale-archive
  ENV LOGNAME=little-dude
  ENV LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
  ENV MANAGERPID=1808
  ENV MOZ_PLUGIN_PATH=/home/little-dude/.nix-profile/lib/mozilla/plugins:/etc/profiles/per-user/little-dude/lib/mozilla/plugins:/nix/var/nix/profiles/default/lib/mozilla/plugins:/run/current-system/sw/lib/mozilla/plugins
  ENV NAUTILUS_EXTENSION_DIR=/nix/store/f3f2cis9inb5dhfnnmam5xgrpddljahw-system-path/lib/nautilus/extensions-3.0
  ENV NIXPKGS_CONFIG=/etc/nix/nixpkgs-config.nix
  ENV NIX_BINTOOLS=/nix/store/yi7jnpnh588bq8bpf0gxigzzw1qk5dqj-binutils-wrapper-2.31.1
  ENV NIX_BINTOOLS_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu=1
  ENV NIX_BUILD_CORES=8
  ENV NIX_BUILD_TOP=/build
  ENV NIX_CC=/nix/store/2zrp7866az7z1wbpqgdal5a5h5z5qawa-gcc-wrapper-9.3.0
  ENV NIX_CC_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu=1
  ENV NIX_ENFORCE_NO_NATIVE=1
  ENV NIX_GSETTINGS_OVERRIDES_DIR=/nix/store/afz3jmnyz11vwp6p6cbrnpswfcsd4881-nixos-gsettings-desktop-schemas/share/gsettings-schemas/nixos-gsettings-overrides/glib-2.0/schemas
  ENV NIX_HARDENING_ENABLE=fortify stackprotector pic strictoverflow format relro bindnow
  ENV NIX_INDENT_MAKE=1
  ENV NIX_LDFLAGS=-rpath /nix/store/5xcy8fqf0mc1n32hszv1r83nlxmljv6w-lorri-keep-env-hack-cross-compile-reqwest/lib64 -rpath /nix/store/5xcy8fqf0mc1n32hszv1r83nlxmljv6w-lorri-keep-env-hack-cross-compile-reqwest/lib  -L/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib -L/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib
  ENV NIX_LOG_FD=2
  ENV NIX_PATH=/home/little-dude/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels
  ENV NIX_PROFILES=/run/current-system/sw /nix/var/nix/profiles/default /etc/profiles/per-user/little-dude /home/little-dude/.nix-profile
  ENV NIX_STORE=/nix/store
  ENV NIX_USER_PROFILE_DIR=/nix/var/nix/profiles/per-user/little-dude
  ENV NM=nm
  ENV NUM_JOBS=8
  ENV OBJCOPY=objcopy
  ENV OBJDUMP=objdump
  ENV OLDPWD=/home/little-dude/code/cross-compile-reqwest/src
  ENV OPT_LEVEL=0
  ENV OUT_DIR=/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out
  ENV P9K_SSH=0
  ENV P9K_TTY=old
  ENV PAGER=less -R
  ENV PATH=/nix/store/mayg518s13h6gyvr600n0n513gw61ws3-patchelf-0.11/bin:/nix/store/2zrp7866az7z1wbpqgdal5a5h5z5qawa-gcc-wrapper-9.3.0/bin:/nix/store/5366flzkjhpsbw78zmdr9c20b7zjj49m-gcc-9.3.0/bin:/nix/store/mi0l6yp23d930f6djfi2dzp363glr2lk-glibc-2.31-bin/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/yi7jnpnh588bq8bpf0gxigzzw1qk5dqj-binutils-wrapper-2.31.1/bin:/nix/store/1ar9gcmvikdk1wij0cw4fnwvl5i07ag1-binutils-2.31.1/bin:/nix/store/mi0l6yp23d930f6djfi2dzp363glr2lk-glibc-2.31-bin/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/vij0m1vpjfxchfwjyns71apya7jg27id-androidsdk/bin:/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/bin:/nix/store/hzwqjh63lz3w8vif5cjc2a5jcs3cdnxb-android-studio-stable-4.0.1.0/bin:/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/ab8kxlz6pkaw2qnskqhmrlhbqd8pjq3k-findutils-4.7.0/bin:/nix/store/xqkzxwbv37ns0wjg3p9jfxj0b4r96d27-diffutils-3.7/bin:/nix/store/rl2frzwv9gl6b0fxbr0mav432f8h6vs3-gnused-4.8/bin:/nix/store/r8jl0nvjlqzhdmh5vnfrqfnf496gkjy7-gnugrep-3.4/bin:/nix/store/y4f6wp3p8wi304l7x47bh4qq7zf5cqjs-gawk-5.1.0/bin:/nix/store/wbc9s0f2cd0yqr47zjmh94lb03yw75sd-gnutar-1.32/bin:/nix/store/n2rh0xdv26pg4157jsnlvbnh6ykj0hrg-gzip-1.10/bin:/nix/store/kxcwjq4sd5iiqgiqp39zqs4pczb1i2kj-bzip2-1.0.6.0.1-bin/bin:/nix/store/f6h17kyn28333p4qniwwbncma3mrpqp8-gnumake-4.3/bin:/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin:/nix/store/x2hjq6n6w2c7dx051k9iwvyg04zi3cfk-patch-2.7.6/bin:/nix/store/l7lw71g76hly1f56smvzh331857lgav8-xz-5.2.5-bin/bin:/nix/store/mayg518s13h6gyvr600n0n513gw61ws3-patchelf-0.11/bin:/nix/store/2zrp7866az7z1wbpqgdal5a5h5z5qawa-gcc-wrapper-9.3.0/bin:/nix/store/5366flzkjhpsbw78zmdr9c20b7zjj49m-gcc-9.3.0/bin:/nix/store/mi0l6yp23d930f6djfi2dzp363glr2lk-glibc-2.31-bin/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/yi7jnpnh588bq8bpf0gxigzzw1qk5dqj-binutils-wrapper-2.31.1/bin:/nix/store/1ar9gcmvikdk1wij0cw4fnwvl5i07ag1-binutils-2.31.1/bin:/nix/store/mi0l6yp23d930f6djfi2dzp363glr2lk-glibc-2.31-bin/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/vij0m1vpjfxchfwjyns71apya7jg27id-androidsdk/bin:/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/bin:/nix/store/hzwqjh63lz3w8vif5cjc2a5jcs3cdnxb-android-studio-stable-4.0.1.0/bin:/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/ab8kxlz6pkaw2qnskqhmrlhbqd8pjq3k-findutils-4.7.0/bin:/nix/store/xqkzxwbv37ns0wjg3p9jfxj0b4r96d27-diffutils-3.7/bin:/nix/store/rl2frzwv9gl6b0fxbr0mav432f8h6vs3-gnused-4.8/bin:/nix/store/r8jl0nvjlqzhdmh5vnfrqfnf496gkjy7-gnugrep-3.4/bin:/nix/store/y4f6wp3p8wi304l7x47bh4qq7zf5cqjs-gawk-5.1.0/bin:/nix/store/wbc9s0f2cd0yqr47zjmh94lb03yw75sd-gnutar-1.32/bin:/nix/store/n2rh0xdv26pg4157jsnlvbnh6ykj0hrg-gzip-1.10/bin:/nix/store/kxcwjq4sd5iiqgiqp39zqs4pczb1i2kj-bzip2-1.0.6.0.1-bin/bin:/nix/store/f6h17kyn28333p4qniwwbncma3mrpqp8-gnumake-4.3/bin:/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin:/nix/store/x2hjq6n6w2c7dx051k9iwvyg04zi3cfk-patch-2.7.6/bin:/nix/store/l7lw71g76hly1f56smvzh331857lgav8-xz-5.2.5-bin/bin:/nix/store/mayg518s13h6gyvr600n0n513gw61ws3-patchelf-0.11/bin:/nix/store/2zrp7866az7z1wbpqgdal5a5h5z5qawa-gcc-wrapper-9.3.0/bin:/nix/store/5366flzkjhpsbw78zmdr9c20b7zjj49m-gcc-9.3.0/bin:/nix/store/mi0l6yp23d930f6djfi2dzp363glr2lk-glibc-2.31-bin/bin:/nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31/bin:/nix/store/yi7jnpnh588bq8bpf0gxigzzw1qk5dqj-binutils-wrapper-2.31.1/bin:/nix/store/1ar9gcmvikdk1wij0cw4fnwvl5i07ag1-binutils-2.31.1/bin:/nix/store/vij0m1vpjfxchfwjyns71apya7jg27id-androidsdk/bin:/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/bin:/nix/store/hzwqjh63lz3w8vif5cjc2a5jcs3cdnxb-android-studio-stable-4.0.1.0/bin:/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/bin:/nix/store/ab8kxlz6pkaw2qnskqhmrlhbqd8pjq3k-findutils-4.7.0/bin:/nix/store/xqkzxwbv37ns0wjg3p9jfxj0b4r96d27-diffutils-3.7/bin:/nix/store/rl2frzwv9gl6b0fxbr0mav432f8h6vs3-gnused-4.8/bin:/nix/store/r8jl0nvjlqzhdmh5vnfrqfnf496gkjy7-gnugrep-3.4/bin:/nix/store/y4f6wp3p8wi304l7x47bh4qq7zf5cqjs-gawk-5.1.0/bin:/nix/store/wbc9s0f2cd0yqr47zjmh94lb03yw75sd-gnutar-1.32/bin:/nix/store/n2rh0xdv26pg4157jsnlvbnh6ykj0hrg-gzip-1.10/bin:/nix/store/kxcwjq4sd5iiqgiqp39zqs4pczb1i2kj-bzip2-1.0.6.0.1-bin/bin:/nix/store/f6h17kyn28333p4qniwwbncma3mrpqp8-gnumake-4.3/bin:/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin:/nix/store/x2hjq6n6w2c7dx051k9iwvyg04zi3cfk-patch-2.7.6/bin:/nix/store/l7lw71g76hly1f56smvzh331857lgav8-xz-5.2.5-bin/bin:/run/wrappers/bin:/home/little-dude/.nix-profile/bin:/etc/profiles/per-user/little-dude/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/home/little-dude/.config/zsh/plugins/zsh-syntax-highlighting:/home/little-dude/.config/zsh/plugins/powerlevel10k:/home/little-dude/.config/zsh/plugins/zsh-autosuggestions
  ENV POWERLINE_COMMAND=powerline
  ENV PROFILE=debug
  ENV PWD=/home/little-dude/code/cross-compile-reqwest
  ENV QTWEBKIT_PLUGIN_PATH=/home/little-dude/.nix-profile/lib/mozilla/plugins/:/etc/profiles/per-user/little-dude/lib/mozilla/plugins/:/nix/var/nix/profiles/default/lib/mozilla/plugins/:/run/current-system/sw/lib/mozilla/plugins/
  ENV QT_PLUGIN_PATH=/home/little-dude/.nix-profile/lib/qt4/plugins:/home/little-dude/.nix-profile/lib/kde4/plugins:/etc/profiles/per-user/little-dude/lib/qt4/plugins:/etc/profiles/per-user/little-dude/lib/kde4/plugins:/nix/var/nix/profiles/default/lib/qt4/plugins:/nix/var/nix/profiles/default/lib/kde4/plugins:/run/current-system/sw/lib/qt4/plugins:/run/current-system/sw/lib/kde4/plugins
  ENV RANLIB=ranlib
  ENV READELF=readelf
  ENV RUSTC=rustc
  ENV RUSTDOC=rustdoc
  ENV RUST_BACKTRACE=1
  ENV SESSION_MANAGER=local/xain-laptop:@/tmp/.ICE-unix/1949,unix/xain-laptop:/tmp/.ICE-unix/1949
  ENV SHELL=/run/current-system/sw/bin/zsh
  ENV SHLVL=3
  ENV SIZE=size
  ENV SOURCE_DATE_EPOCH=315532800
  ENV SSH_ASKPASS=/nix/store/jfg6bxfp6kg4hfxc4cpcx9k2sqp5csla-seahorse-3.36.2/libexec/seahorse/ssh-askpass
  ENV SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
  ENV SSL_CERT_DIR=/etc/pki/tls/certs
  ENV SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
  ENV STRIGI_PLUGIN_PATH=/home/little-dude/.nix-profile/lib/strigi/:/etc/profiles/per-user/little-dude/lib/strigi/:/nix/var/nix/profiles/default/lib/strigi/:/run/current-system/sw/lib/strigi/
  ENV STRINGS=strings
  ENV STRIP=strip
  ENV TARGET=aarch64-linux-android
  ENV TARGET_AR=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-ar
  ENV TARGET_CC=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc
  ENV TERM=screen-256color
  ENV TERMINFO_DIRS=/home/little-dude/.nix-profile/share/terminfo:/etc/profiles/per-user/little-dude/share/terminfo:/nix/var/nix/profiles/default/share/terminfo:/run/current-system/sw/share/terminfo
  ENV TMUX=/run/user/1000/tmux-1000/default,17706,0
  ENV TMUX_PANE=%8
  ENV TMUX_TMPDIR=/run/user/1000
  ENV TZDIR=/etc/zoneinfo
  ENV USER=little-dude
  ENV USERNAME=little-dude
  ENV VTE_VERSION=6002
  ENV WINDOWPATH=2
  ENV XAUTHORITY=/run/user/1000/gdm/Xauthority
  ENV XCURSOR_PATH=/home/little-dude/.icons:/home/little-dude/.local/share/icons:/home/little-dude/.nix-profile/share/icons:/home/little-dude/.nix-profile/share/pixmaps:/etc/profiles/per-user/little-dude/share/icons:/etc/profiles/per-user/little-dude/share/pixmaps:/nix/var/nix/profiles/default/share/icons:/nix/var/nix/profiles/default/share/pixmaps:/run/current-system/sw/share/icons:/run/current-system/sw/share/pixmaps
  ENV XDG_CONFIG_DIRS=/etc/xdg:/home/little-dude/.nix-profile/etc/xdg:/etc/profiles/per-user/little-dude/etc/xdg:/nix/var/nix/profiles/default/etc/xdg:/run/current-system/sw/etc/xdg:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/etc/xdg:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/etc/xdg
  ENV XDG_CURRENT_DESKTOP=GNOME
  ENV XDG_DATA_DIRS=/nix/store/3w108q5kb6kc7hgl8jrykhh31jrsl3li-gnome-terminal-3.36.2/share:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/9pn6pavlxc8m2i4pcg7a6338l8fzpb1f-nautilus-3.36.3/share/gsettings-schemas/nautilus-3.36.3:/nix/store/3w108q5kb6kc7hgl8jrykhh31jrsl3li-gnome-terminal-3.36.2/share/gsettings-schemas/gnome-terminal-3.36.2:/nix/store/g7i7rlkklk3bwad861ysqnc26ci4h530-shared-mime-info-1.13.1/share:/nix/store/8zh23qs3ibn7rinidkq4cryzf73lpnk4-gnome-shell-3.36.4/share:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/0w3r4zvw5vsn6kb8gbiw8zi55vazz7qw-gnome-keyring-3.36.0/share/gsettings-schemas/gnome-keyring-3.36.0:/nix/store/74vj73dva1q9ym5y0gsb118ai7d4z1za-gcr-3.36.0/share/gsettings-schemas/gcr-3.36.0:/nix/store/gn2vwv9ckm585wnaql0n1lj8z2ckbhy6-mutter-3.36.5/share/gsettings-schemas/mutter-3.36.5:/nix/store/8bbbsvawdzall3d2a7flgry47ax7q4qg-evolution-data-server-3.36.5/share/gsettings-schemas/evolution-data-server-3.36.5:/nix/store/0d868l70nqj216hkzfyk6921n7732js3-gdm-3.34.1/share/gsettings-schemas/gdm-3.34.1:/nix/store/5s7bif2q92pfa2p19wzbqqqsb1nzymjy-gnome-clocks-3.36.2/share/gsettings-schemas/gnome-clocks-3.36.2:/nix/store/h5xxlyb1n6lvl3282wjssq99f5awvs9i-ibus-1.5.22/share/gsettings-schemas/ibus-1.5.22:/nix/store/x5md2m837h2fjg1nxf3w8c3yi9rms9z0-telepathy-logger-0.8.2/share/gsettings-schemas/telepathy-logger-0.8.2:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/share/gsettings-schemas/gnome-settings-daemon-3.36.1:/nix/store/5mw636h1ryinh248a7mlsvdflr10hg71-libgweather-3.36.1/share/gsettings-schemas/libgweather-3.36.1:/nix/store/mjwnj3zdp7dx6p6wrhcv0fqydx2xvr3w-libnma-1.8.30/share/gsettings-schemas/libnma-1.8.30:/nix/store/8zh23qs3ibn7rinidkq4cryzf73lpnk4-gnome-shell-3.36.4/share/gsettings-schemas/gnome-shell-3.36.4:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share:/nix/store/l465dc6mbqqxc048k8rj0v23jfjvv1jc-cups-2.3.3/share:/nix/store/74vj73dva1q9ym5y0gsb118ai7d4z1za-gcr-3.36.0/share:/nix/store/khipflxr15mf55m20kbmjmw561v1alpa-adwaita-icon-theme-3.36.1/share:/nix/store/drwx7p3083shd8xdcc6kdkpw2hgf02kd-hicolor-icon-theme-0.17/share:/nix/store/bv51lr6zd7q0xk374fwwbxlpj5zncfm8-gnome-bluetooth-3.34.1/share:/nix/store/5s7bif2q92pfa2p19wzbqqqsb1nzymjy-gnome-clocks-3.36.2/share:/nix/store/h5xxlyb1n6lvl3282wjssq99f5awvs9i-ibus-1.5.22/share:/nix/store/gjhivb3c1sxp41fz7z80yscgdp1hd3qk-gnome-mimeapps/share:/home/little-dude/.nix-profile/share:/etc/profiles/per-user/little-dude/share:/nix/var/nix/profiles/default/share:/run/current-system/sw/share:/nix/store/8zh23qs3ibn7rinidkq4cryzf73lpnk4-gnome-shell-3.36.4/share/gsettings-schemas/gnome-shell-3.36.4:/nix/store/9hpbs74f67v1cx8gfdi2z9zi68zbhhjj-gnome-shell-extensions-3.36.3/share/gsettings-schemas/gnome-shell-extensions-3.36.3:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/share/gsettings-schemas/gnome-settings-daemon-3.36.1:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/share/gsettings-schemas/gnome-settings-daemon-3.36.1:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share/gsettings-schemas/gnome-session-3.36.0:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share/gsettings-schemas/gnome-session-3.36.0:/nix/store/8zh23qs3ibn7rinidkq4cryzf73lpnk4-gnome-shell-3.36.4/share:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/pjkkj0wf4fiilydvwix1i1pxbh4h8nx1-gsettings-desktop-schemas-3.36.1/share/gsettings-schemas/gsettings-desktop-schemas-3.36.1:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/jh3g99wnj2k7gcr8mh8cgz1jhs16br3s-gtk+3-3.24.21/share/gsettings-schemas/gtk+3-3.24.21:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/share/gsettings-schemas/gnome-settings-daemon-3.36.1:/nix/store/9fx4214q5gbmf12vmwdnhwmn1nw7mkrz-gnome-settings-daemon-3.36.1/share/gsettings-schemas/gnome-settings-daemon-3.36.1:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share/gsettings-schemas/gnome-session-3.36.0:/nix/store/dr0r993zk1d79q0pnw93zxns3cgv3k38-gnome-session-3.36.0/share/gsettings-schemas/gnome-session-3.36.0:/nix/store/8zh23qs3ibn7rinidkq4cryzf73lpnk4-gnome-shell-3.36.4/share
  ENV XDG_DESKTOP_PORTAL_DIR=/nix/store/dlpnh1as5ccfw0ick0wqcl5jgfxr0p78-xdg-portals/share/xdg-desktop-portal/portals
  ENV XDG_MENU_PREFIX=gnome-
  ENV XDG_RUNTIME_DIR=/run/user/1000
  ENV XDG_SESSION_CLASS=user
  ENV XDG_SESSION_DESKTOP=gnome
  ENV XDG_SESSION_TYPE=x11
  ENV _=/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/bin/cargo
  ENV __ETC_PROFILE_DONE=1
  ENV __HM_SESS_VARS_SOURCED=1
  ENV __NIXOS_SET_ENVIRONMENT_DONE=1
  ENV allowSubstitutes=
  ENV buildInputs=/nix/store/vij0m1vpjfxchfwjyns71apya7jg27id-androidsdk /nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045 /nix/store/hzwqjh63lz3w8vif5cjc2a5jcs3cdnxb-android-studio-stable-4.0.1.0 /nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113
  ENV builder=/nix/store/12z3qw2iwfknajsxyqssyfkv8kqa4xw4-lorri-runtime-tools/bin/bash
  ENV configureFlags=
  ENV depsBuildBuild=
  ENV depsBuildBuildPropagated=
  ENV depsBuildTarget=
  ENV depsBuildTargetPropagated=
  ENV depsHostHost=
  ENV depsHostHostPropagated=
  ENV depsTargetTarget=
  ENV depsTargetTargetPropagated=
  ENV doCheck=
  ENV doInstallCheck=
  ENV extraClosure=/nix/store/12z3qw2iwfknajsxyqssyfkv8kqa4xw4-lorri-runtime-tools /nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23 /nix/store/arb8311fjm1dsrbsy8j7pdanwnz1qwxv-libidn2-2.3.0 /nix/store/gd3nl6hcc8mzq8fmxdvl6czh3l0n4la5-coreutils-8.31 /nix/store/kyi6558fwmxivw4j70b2nx36m6200mjp-attr-2.4.48 /nix/store/mh78fk3x12q2a77srgkzv16h0irl8r61-glibc-2.31 /nix/store/r2nywq3ziag55zi6dqcxkpb6yla044kq-libunistring-0.9.10 /nix/store/wwli16j370iq1d6w0rz9l6hbkb54jzk7-bash-4.4-p23-man /nix/store/zl08ih0skhpxnny9n1ydihmssfxxw5hr-acl-2.2.53
  ENV is_vim=ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\S+\/)?g?(view|n?vim?x?)(diff)?$'
  ENV name=lorri-keep-env-hack-cross-compile-reqwest
  ENV nativeBuildInputs=
  ENV origArgs=-e /nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh
  ENV origBuilder=/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin/bash
  ENV origExtraClosure=
  ENV origOutputs=out
  ENV origPATH=
  ENV origSystem=x86_64-linux
  ENV out=/nix/store/5xcy8fqf0mc1n32hszv1r83nlxmljv6w-lorri-keep-env-hack-cross-compile-reqwest
  ENV outputs=out
  ENV patches=
  ENV preHook=
  ENV preferLocalBuild=1
  ENV propagatedBuildInputs=
  ENV propagatedNativeBuildInputs=
  ENV shell=/nix/store/6737cq9nvp4k5r70qcgf61004r0l2g3v-bash-4.4-p23/bin/bash
  ENV stdenv=/nix/store/50780gywsyjad8nxrf79q6qx7y7mqgal-stdenv-linux
  ENV strictDeps=
  ENV system=x86_64-linux
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/aesv8-armx-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/aesv8-armx-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/ghashv8-armx-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/ghashv8-armx-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/vpaes-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/vpaes-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/armv8-mont-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/armv8-mont-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/chacha-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/chacha-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/ecp_nistz256-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/ecp_nistz256-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/ghash-neon-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/ghash-neon-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/poly1305-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/poly1305-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/sha512-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/sha512-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/sha256-armv8-linux64.o" "/home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/pregenerated/sha256-armv8-linux64.S"
  running "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-gcc" "-O0" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-fno-omit-frame-pointer" "-I" "include" "-Wall" "-Wextra" "-std=c1x" "-Wbad-function-cast" "-Wnested-externs" "-Wstrict-prototypes" "-pedantic" "-pedantic-errors" "-Wall" "-Wextra" "-Wcast-align" "-Wcast-qual" "-Wconversion" "-Wenum-compare" "-Wfloat-equal" "-Wformat=2" "-Winline" "-Winvalid-pch" "-Wmissing-field-initializers" "-Wmissing-include-dirs" "-Wredundant-decls" "-Wshadow" "-Wsign-compare" "-Wsign-conversion" "-Wundef" "-Wuninitialized" "-Wwrite-strings" "-fno-strict-aliasing" "-fvisibility=hidden" "-fstack-protector" "-g3" "-DNDEBUG" "-c" "-o/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out/aes_nohw.o" "crypto/fipsmodule/aes/aes_nohw.c"
  crypto/fipsmodule/aes/aes_nohw.c:18:10: fatal error: 'string.h' file not found
  #include <string.h>
           ^~~~~~~~~~
  1 error generated.
  thread 'main' panicked at 'execution failed', /home/little-dude/.cargo/registry/src/github.com-1ecc6299db9ec823/ring-0.16.15/build.rs:664:9
  stack backtrace:
     0: std::panicking::begin_panic
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/std/src/panicking.rs:505
     1: build_script_build::run_command
               at ./build.rs:664
     2: build_script_build::compile
               at ./build.rs:532
     3: build_script_build::build_library::{{closure}}
               at ./build.rs:467
     4: core::ops::function::impls::<impl core::ops::function::FnOnce<A> for &mut F>::call_once
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/ops/function.rs:280
     5: core::option::Option<T>::map
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/option.rs:437
     6: <core::iter::adapters::Map<I,F> as core::iter::traits::iterator::Iterator>::next
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/iter/adapters/mod.rs:914
     7: alloc::vec::Vec<T>::extend_desugared
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/alloc/src/vec.rs:2449
     8: <alloc::vec::Vec<T> as alloc::vec::SpecExtend<T,I>>::spec_extend
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/alloc/src/vec.rs:2372
     9: <alloc::vec::Vec<T> as alloc::vec::SpecFromIterNested<T,I>>::from_iter
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/alloc/src/vec.rs:2155
    10: <alloc::vec::Vec<T> as alloc::vec::SpecFromIter<T,I>>::from_iter
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/alloc/src/vec.rs:2178
    11: <alloc::vec::Vec<T> as core::iter::traits::collect::FromIterator<T>>::from_iter
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/alloc/src/vec.rs:2017
    12: core::iter::traits::iterator::Iterator::collect
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/iter/traits/iterator.rs:1647
    13: build_script_build::build_library
               at ./build.rs:463
    14: build_script_build::build_c_code::{{closure}}
               at ./build.rs:436
    15: <core::slice::Iter<T> as core::iter::traits::iterator::Iterator>::for_each
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/slice/mod.rs:3907
    16: build_script_build::build_c_code
               at ./build.rs:435
    17: build_script_build::ring_build_rs_main
               at ./build.rs:298
    18: build_script_build::main
               at ./build.rs:255
    19: core::ops::function::FnOnce::call_once
               at /rustc/0d0f6b113047b2cf9afbde990cee30fd5b866469/library/core/src/ops/function.rs:227
  note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
warning: build failed, waiting for other jobs to finish...
error: build failed
```
