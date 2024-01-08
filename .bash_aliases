# For working with my dotfiles repo
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias l='ls -lh --color=auto'
alias la='ls -lAh --color=auto'
alias hi=history
alias d='dirs -v | alc'
alias u=pushd
alias o=popd

# Bash aliases can't take arguments, use a function
hig() {
  history | grep "$@" | alc
}
