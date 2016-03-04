ps ax | perl -ne '/(\d+).+memsqld --port=(\d+)/ and print "sudo gdb --pid=$1 --batch -x=~/btall.gdb > ~/stack-$2-$1.txt \n"' > capture_stacks.sh
