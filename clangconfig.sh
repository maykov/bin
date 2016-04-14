find . -name "CMakeCache.txt" | xargs rm -f
CC=clang CXX="clang++ -w -I $(llvm-config --includedir) -I /usr/include/valgrind" cmake . -DHARDCODE_COMPILER=OFF
