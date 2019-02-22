#!/bin/bash

dir=`pwd`

# set up the build directory
mkdir -p build
cd build

mkdir -p wasm
cd wasm

mkdir -p root
mkdir -p libskeleton
cd libskeleton
  
# finally, run configuration script
export EMCC_WASM_BACKEND=1
emconfigure ../../../libskeleton/configure \
	--prefix="$dir/build/wasm/root" \
	PKG_CONFIG_PATH="$dir/build/wasm/root/lib/pkgconfig" \
	--disable-shared \
	CFLAGS="-s WASM_OBJECT_FILES=0"

# compile libskeleton
emmake make -j4 || exit 1
emmake make install || exit 1

cd ..
cd ..
cd ..
