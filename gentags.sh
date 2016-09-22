pushd ~/ctags
ctags -R ~/memsql
cd /
find /home/vagrant/memsql -name '*.c' -o -name '*.cc' -o -name '*.cpp' > ~/ctags/cscope.files
cd ~/ctags
cscope -b
export CSCOPE_DB=~/ctags/cscope.out
popd
