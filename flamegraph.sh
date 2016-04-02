cd ~
sudo perf record -F 997 -p $(pgrep memsqld | head -n 1) --call-graph=fp -o perf.data -- sleep 10
sudo chown $USER perf.data
perf script -i perf.data | FlameGraph/stackcollapse-perf.pl | FlameGraph/flamegraph.pl > flamegraph.svg
cp flamegraph.svg /vagrant/
