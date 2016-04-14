find . -name "CMakeCache.txt" | xargs rm -f
CC=clang CXX="clang++ -w -I $(llvm-config --includedir)" cmake . -DHARDCODE_COMPILER=OFF
