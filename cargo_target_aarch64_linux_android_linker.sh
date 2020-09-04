#!/usr/bin/env bash

set -x

NDK_LIBS=$NDK/libexec/android-sdk/ndk-bundle/platforms/android-21/arch-x86/usr/lib/

$NDK_BUILD_TOOLS/aarch64-linux-android-gcc \
    -fuse-ld=$NDK_BUILD_TOOLS/aarch64-linux-android-ld \
    -Wl,-rpath-link=$NDK_LIBS -L $NDK_LIBS \
    $@
