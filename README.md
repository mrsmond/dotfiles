# dotfiles
I followed [this guide](https://www.atlassian.com/git/tutorials/dotfiles) to
create a bare git repo on the side to manage my configuration files.

First I created a repo on github, then cloned it to my machine:

```
git clone --bare  git@github.com:mrsmond/dotfiles.git $HOME/.dotfiles
```

I added the alias config as given in the guide, then I got the only two files in
the repo after creating it (this README.md file and LICENSE):

```
config checkout
```

Then I can see we are clean:

```
config status
```

Then I can add files, commit them, etc as normal using the config alias.

The first thing it did was to create a .gitignore with the .dotfiles repo
ignored as instructed in the guide under the section about setting up a new
system:

```
config add .gitignore
```

Remember to add your public ssh key to [github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

