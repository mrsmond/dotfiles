# This file is read for interactive login shells, i.e. when you open a terminal
# or ssh into another computer. When you create a new window in tmux it creates
# an interactive login shell.

# Only .bashrc is read for interactive non-login shells, i.e. when you run bash
# from the existing login shell or open a new tab in a terminal program like
# Gnome/Mate Terminal, but not tmux. However, tmux runs .bash_profile which then
# sources .bashrc file.

# So only modify envirnonment variables here as they will be done once

export PATH="~/bin:$PATH"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi
