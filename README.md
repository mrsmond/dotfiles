# dotfiles
I followed [this guide](https://www.atlassian.com/git/tutorials/dotfiles) to
create a bare git repo on the side to manage my configuration files.

First I created a repo on github, then cloned it to my machine using the instruction below for setting it up on a new machine.

The directory name `.dotfiles` is in the `.gitignore` file.

Remember to use the config alias to add files, commit them, etc.

Remember to add your public ssh key to [github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

## Starting on a new machine
Get the bare repo into the `.dotfiles` directory:

```
git clone --bare  git@github.com:mrsmond/dotfiles.git $HOME/.dotfiles
```

Create the alias given in the guide (for bash and zsh). Note that this is already set in .bash_aliases which will be checked out, but saves a bit of typing now.
```
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Make sure the username is the same as the repo so I don't use my work details:

```
config config user.name "mrsmond"
config config user.email "my email"
```

Check out all the managed files:
```
config checkout
```

To only track files I've added, which is part of the trick of this method:

```
config config --local status.showUntrackedFiles no
```

Create a branch to work off:

```
config checkout -b <branch name>
```

The main branch is for my work WSL set up.
