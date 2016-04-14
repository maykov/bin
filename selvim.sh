echo Navigating all vim sessions to $1:$2
for i in $(tmux list-panes -a -F '#{pane_current_command}:#{pane_id}'); do
    cmd=${i%:*}
    pane=${i#*:}
    [ "$cmd" == 'vi' ] && tmux send-keys -t $pane Escape :e $1 Enter :$2 Enter
done
