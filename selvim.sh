if [ -z "$1" ]
then
    echo "Usage: selvim.sh file [line number]"
    exit 1
fi

fn=$(readlink -m $1)
if [ ! -e $fn ]
then
    echo "$fn doesn't exist"
    exit 1
fi
# echo Navigating all vim sessions to $fn:$2
vimcmd="Escape :e $fn Enter"
if [ -n "$2" ]
then
    vimcmd="$vimcmd :$2 Enter"
fi
for i in $(tmux list-panes -a -F '#{pane_current_command}:#{pane_id}'); do
    cmd=${i%:*}
    pane=${i#*:}
    if [ "vi" = "$cmd" ]
    then
      tmux send-keys -t $pane $vimcmd
    fi
done
