echo This script configures MemSQL to be compiled with clang
# TODO: debug/retail, ASAN/NoASAN, gcc/clang
FLAGS="\
-isystem /usr/lib/llvm-3.6/lib/clang/3.6.2/include/ \
-nostdinc \
-I/usr/include \
-I/usr/include/x86_64-linux-gnu \
-w -fPIC -fno-omit-frame-pointer -fsanitize=address -O2 -g \
-I/home/vagrant/memsql \
-I/home/vagrant/memsql/include \
-I/home/vagrant/memsql/lockfree \
-I/home/vagrant/memsql/typesystem \
-I/home/vagrant/memsql/lockfree/parquet/thrift/include \
-I/home/vagrant/memsql/lockfree/parquet/common \
-I/home/vagrant/memsql/lockfree/parquet/metadata/gen-cpp \
-L/home/vagrant/memsql/objdir/usr/local/lib64 \
-I/usr/include/llvm-c-3.6/ \
-I/usr/include/llvm-3.6/ \
-I/home/vagrant/memsql/objdir/usr/include/ \
-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS \
-v \
"

# TODO: some files use consts larger than 128 for signed chars
FLAGS="$FLAGS -Wno-narrowing"

C_FLAGS=$FLAGS

CXX_FLAGS="$FLAGS -std=c++11"

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=/usr/bin/clang-3.6 -DCMAKE_CXX_COMPILER=/usr/bin/clang++-3.6 -DHARDCODE_COMPILER=OFF -DHARDCODE_COMPILER_OPTIONS=OFF -DCMAKE_CXX_FLAGS="$CXX_FLAGS" -DCMAKE_C_FLAGS="$C_FLAGS" .

