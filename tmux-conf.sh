#!/bin/sh

SCRIPT="$0"

modusoperandi() {
cat << EOF
# Modus Operandi

  METHOD=install sh $SCRIPT

EOF
}

tmuxconf () {
cat << EOF
# set default-terminal colors to display default terminal colors
set -g default-terminal "xterm-256color"
# set-option -ga terminal-overrides ',xterm-256color:Tc

# Proper colors
set-option -sa terminal-features ',xterm-256color:RGB'

# Undercurl
set-option -g default-terminal "tmux-256color"
set-option -ga terminal-features ",xterm-256color:usstyle"

# nvim
set-option -sg escape-time 10
set-option -g focus-events on

# mouse
set -g mouse on

# indicizzazione
set -g base-index 1
setw -g pane-base-index 1


# bindings
bind c new-window -c '#{pane_current_path}'
bind '%' split-window -h -c '#{pane_current_path}'
bind '"' split-window -v -c '#{pane_current_path}'
EOF
}

case "$METHOD:" in
  "install:")
    tmuxconf > "$HOME/.tmux.conf"
    ;;
  *)
    modusoperandi
    ;;
esac
