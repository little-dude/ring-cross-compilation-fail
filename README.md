- Rust version: `rustc 1.48.0-nightly (0d0f6b113 2020-09-03)`
- OS: NixOS unstable, kernel 5.7.16
- NDK version: `18.1.5063045`

```
export NDK=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045
export NDK_BUILD_TOOLS=$NDK/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/

export TARGET_CC=$NDK_BUILD_TOOLS/aarch64-linux-android-gcc               
export TARGET_AR=$NDK_BUILD_TOOLS/aarch64-linux-android-ar
export CC_AARCH64_LINUX_ANDROID=$TARGET_CC
export AR_AARCH64_LINUX_ANDROID=$TARGET_AR
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=$TARGET_CC
export CARGO_TARGET_AARCH64_LINUX_ANDROID_AR=$TARGET_AR
```

Building fails with:

```
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
```

The problem can be fixed by passing `--sysroot` and the appropriate `-I` flag
to clang in `TARGET_CC`:

```
export NDK_SYSROOT=$NDK/libexec/android-sdk/ndk-bundle/sysroot/
export TARGET_CC="$NDK_BUILD_TOOLS/aarch64-linux-android-gcc --sysroot $NDK_SYSROOT -I$NDK_SYSROOT/usr/include/aarch64-linux-android/"
export CC_AARCH64_LINUX_ANDROID=$TARGET_CC
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=$TARGET_CC
```

Things now fail with the linker:

```
error: linker `/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-gcc --sysroot /nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/sysroot/ -I/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/sysroot//usr/include/aarch64-linux-android/` not found
  |
  = note: No such file or directory (os error 2)

error: aborting due to previous error; 1 warning emitted

error: could not compile `cross-compile-reqwest`.

To learn more, run the command again with --verbose.
```

`CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER` is expected to be just a path.  We
don't need the includes anymore, when linking so let's try to set this to just
`$NDK_BUILD_TOOLS/aarch64-linux-android-gcc`:

```
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=$NDK_BUILD_TOOLS/aarch64-linux-android-gcc
```

It now fails with:

```
error: linking with `/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-gcc` failed: exit code: 1
  |
  = note: "/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-gcc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-Wl,--allow-multiple-definition" "-Wl,--eh-frame-hdr" "-L" "/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4yz8zethgx15k72c.rcgu.o" "-o" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/libcross_compile_reqwest_lib.so" "-Wl,--version-script=/tmp/rustcueot3c/list" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4mczro2dkmlon80b.rcgu.o" "-Wl,--gc-sections" "-shared" "-Wl,-zrelro" "-Wl,-znow" "-nodefaultlibs" "-L" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps" "-L" "/home/little-dude/code/cross-compile-reqwest/target/debug/deps" "-L" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out" "-L" "/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib" "-Wl,--start-group" "-Wl,-Bstatic" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libstd-8989e27798d74eca.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libpanic_unwind-0e64415953fa997b.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libminiz_oxide-db2b96dcfdf32e44.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libadler-9b6d9c961ad31ef0.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libobject-dbd14f3235d6450a.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libaddr2line-0053443f102d45c1.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libgimli-9bb468bd65e95896.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_demangle-27b6887395efbc80.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libhashbrown-ceb0324c2b70dd74.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_alloc-00ea0730e1988931.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libunwind-0ba9dc8867f38074.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcfg_if-e71f711bfad2d2f0.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liblibc-65e1a3b3f175c57c.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liballoc-40028077dffec8cb.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_core-d378f02c21743bf8.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcore-da05c6fc972fafa6.rlib" "-Wl,--end-group" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcompiler_builtins-1e26aaa464c9a60e.rlib" "-Wl,-Bdynamic" "-ldl" "-llog" "-lgcc" "-lc" "-lm"
  = note: /nix/store/1ar9gcmvikdk1wij0cw4fnwvl5i07ag1-binutils-2.31.1/bin/ld: unrecognised emulation mode: aarch64linux
          Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om
          clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

For some reason it tries to use our host's linker
`/nix/store/1ar9gcmvikdk1wij0cw4fnwvl5i07ag1-binutils-2.31.1/bin/ld`, whereas
we need the linker for our target platform. We tried to set
`CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER` to
`$NDK_BUILD_TOOLS/aarch64/linux/android-ld`, but despite its name, this
variable really expect the actual compiler. The solution is to add the
`-fuse-ld=$NDK_BUILD_TOOLS/aarch64-linux-android-ld` options, but since the
variable expects a path, we'll have to wrap that into a shell script that we
name `cargo_target_aarch64_linux_android_linker.sh`:

```
#!/usr/bin/env bash

# Path to the dynamic libraries, for the linker
NDK_LIBS=$NDK/libexec/android-sdk/ndk-bundle/platforms/android-21/arch-x86/usr/lib/

$NDK_BUILD_TOOLS/aarch64-linux-android-gcc \
     -fuse-ld=$NDK_BUILD_TOOLS/aarch64-linux-android-ld \
     $@
```

Then set our env variable:

```
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER=$(pwd)/cargo_target_aarch64_linux_android_linker.sh
```

Building still fails:

```
error: linking with `/home/little-dude/code/cross-compile-reqwest/cargo_target_aarch64_linux_android_linker.sh` failed: exit code: 1
  |
  = note: "/home/little-dude/code/cross-compile-reqwest/cargo_target_aarch64_linux_android_linker.sh" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-Wl,--allow-multiple-definition" "-Wl,--eh-frame-hdr" "-L" "/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4yz8zethgx15k72c.rcgu.o" "-o" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/libcross_compile_reqwest_lib.so" "-Wl,--version-script=/tmp/rustc6ABqwB/list" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4mczro2dkmlon80b.rcgu.o" "-Wl,--gc-sections" "-shared" "-Wl,-zrelro" "-Wl,-znow" "-nodefaultlibs" "-L" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps" "-L" "/home/little-dude/code/cross-compile-reqwest/target/debug/deps" "-L" "/home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out" "-L" "/nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib" "-Wl,--start-group" "-Wl,-Bstatic" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libstd-8989e27798d74eca.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libpanic_unwind-0e64415953fa997b.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libminiz_oxide-db2b96dcfdf32e44.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libadler-9b6d9c961ad31ef0.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libobject-dbd14f3235d6450a.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libaddr2line-0053443f102d45c1.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libgimli-9bb468bd65e95896.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_demangle-27b6887395efbc80.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libhashbrown-ceb0324c2b70dd74.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_alloc-00ea0730e1988931.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libunwind-0ba9dc8867f38074.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcfg_if-e71f711bfad2d2f0.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liblibc-65e1a3b3f175c57c.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liballoc-40028077dffec8cb.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_core-d378f02c21743bf8.rlib" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcore-da05c6fc972fafa6.rlib" "-Wl,--end-group" "/nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcompiler_builtins-1e26aaa464c9a60e.rlib" "-Wl,-Bdynamic" "-ldl" "-llog" "-lgcc" "-lc" "-lm"
  = note: + NDK_LIBS=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/platforms/android-21/arch-x86/usr/lib/
          + /nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-gcc -fuse-ld=/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-ld -Wl,--as-needed -Wl,-z,noexecstack -Wl,--allow-multiple-definition -Wl,--eh-frame-hdr -L /nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib /home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4yz8zethgx15k72c.rcgu.o -o /home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/libcross_compile_reqwest_lib.so -Wl,--version-script=/tmp/rustc6ABqwB/list /home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps/cross_compile_reqwest_lib.4mczro2dkmlon80b.rcgu.o -Wl,--gc-sections -shared -Wl,-zrelro -Wl,-znow -nodefaultlibs -L /home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/deps -L /home/little-dude/code/cross-compile-reqwest/target/debug/deps -L /home/little-dude/code/cross-compile-reqwest/target/aarch64-linux-android/debug/build/ring-4c09cef695fad7d8/out -L /nix/store/bpqp3jdkg358iqhsh9qp3bb8625y9lzp-rust-1.48.0-nightly-2020-09-03-0d0f6b113/lib/rustlib/aarch64-linux-android/lib -Wl,--start-group -Wl,-Bstatic /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libstd-8989e27798d74eca.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libpanic_unwind-0e64415953fa997b.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libminiz_oxide-db2b96dcfdf32e44.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libadler-9b6d9c961ad31ef0.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libobject-dbd14f3235d6450a.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libaddr2line-0053443f102d45c1.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libgimli-9bb468bd65e95896.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_demangle-27b6887395efbc80.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libhashbrown-ceb0324c2b70dd74.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_alloc-00ea0730e1988931.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libunwind-0ba9dc8867f38074.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcfg_if-e71f711bfad2d2f0.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liblibc-65e1a3b3f175c57c.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/liballoc-40028077dffec8cb.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/librustc_std_workspace_core-d378f02c21743bf8.rlib /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcore-da05c6fc972fafa6.rlib -Wl,--end-group /nix/store/31sybk2hlcas8mrnc3jzaxlzfpjwmnhx-rust-std/lib/rustlib/aarch64-linux-android/lib/libcompiler_builtins-1e26aaa464c9a60e.rlib -Wl,-Bdynamic -ldl -llog -lgcc -lc -lm
          /nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin//aarch64-linux-android-ld: cannot find crtbegin_so.o: No such file or directory
          clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

Trying to use specify the path to the library doesn't help either:

```
#!/usr/bin/env bash

set -x

NDK_LIBS=$NDK/libexec/android-sdk/ndk-bundle/platforms/android-21/arch-x86/usr/lib/

$NDK_BUILD_TOOLS/aarch64-linux-android-gcc \
    -fuse-ld=$NDK_BUILD_TOOLS/aarch64-linux-android-ld \
    -Wl,-rpath-link=$NDK_LIBS -L $NDK_LIBS \
    $@
```

Yet the library is there:

```
❯ echo $NDK_LIBS
/nix/store/5p5zlzc7h33ab44vw6qf91c02zffz1da-ndk-bundle-18.1.5063045/libexec/android-sdk/ndk-bundle/platforms/android-21/arch-x86/usr/lib/

❯ ls $NDK_LIBS
crtbegin_dynamic.o  crtbegin_static.o  crtend_so.o    libc.a   libcompiler_rt-extras.a  libdl.so   libGLESv1_CM.so  libGLESv3.so       liblog.so  libm.so         libOpenMAXAL.so  libstdc++.a   libz.a
crtbegin_so.o       crtend_android.o   libandroid.so  libc.so  libdl.a                  libEGL.so  libGLESv2.so     libjnigraphics.so  libm.a     libmediandk.so  libOpenSLES.so   libstdc++.so  libz.so
```
