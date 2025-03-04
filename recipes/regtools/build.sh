#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export CPATH=${PREFIX}/include
export CXXFLAGS="${CXXFLAGS} -std=c++14"
mv src/utils/bedtools/gzstream/version src/utils/bedtools/gzstream/version.txt

mkdir build
cd build
cmake -D CMAKE_INSTALL_PREFIX:PATH=${PREFIX} -D CMAKE_INSTALL_RPATH:STRING=${PREFIX}/lib ..
make -j 4

mkdir -p ${PREFIX}/bin
cp regtools ${PREFIX}/bin
chmod +x ${PREFIX}/bin/regtools
