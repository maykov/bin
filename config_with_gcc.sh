# needed packages
# gcc-4.9
# llvm-3.6
# clang-3.6
# libssl-dev


echo This script configures MemSQL to be compiled with clang
# TODO: debug/retail, ASAN/NoASAN, gcc/clang
FLAGS="\
-w -fPIC -fno-omit-frame-pointer -O2 -g -fpermissive \
-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS \
"

# TODO: some files use consts larger than 128 for signed chars
FLAGS="$FLAGS -Wno-narrowing"
FLAGS="$FLAGS -I $(llvm-config --includedir)"

C_FLAGS=$FLAGS

CXX_FLAGS="$FLAGS -std=c++11"

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++-4.9 -DHARDCODE_COMPILER=OFF -DCMAKE_CXX_FLAGS="$CXX_FLAGS" -DCMAKE_C_FLAGS="$C_FLAGS" .

