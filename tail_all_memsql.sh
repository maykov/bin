#!/bin/bash



HOSTS=(PUT, YOUR, HOSTS, HERE)
CMD="tail -f logs/api.log"

echo "Hit CTRL-C to stop"
sleep 0.5
PIDS=""
for host in ${HOSTS[*]}
do
        ssh $host $CMD &
           PIDS="$PIDS $!"
       done

       trap 'kill $PIDS' SIGINT

       wait
