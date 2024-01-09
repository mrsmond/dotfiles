# Only this file is read for interactive non-login shells, i.e. when you run
# bash from the existing login shell or open a new tab in a terminal program
# like Gnome/Mate Terminal, but not tmux. However, tmux runs .bash_profile which
# then sources this file.

# Setup common between different machines. Throw an error if this doesn't exist.
# This should only be changed on the main branch, so changes can easily be
# merged to machine specific branches.
. ~/.bashrc_common

# Setup specific to a machine, which should only exist on a branch (not main)
if [ -e ~/.bashrc_specific ]; then
  . ~/.bashrc_specific
fi
