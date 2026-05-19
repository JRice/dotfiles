From this point forward, anytime you modify your global Git ignore rules, write a new Bash alias, or tweak your .vimrc,
use this workflow:

```bash
gitdot add .bashrc.d/80-aliases.bash
gitdot commit -m "Update an alias"
gitdot push
```

Your workspace is completely synchronized, and you can pull these exact configurations down to any new machine. Use this
processs:

```bash
alias gitdot='/usr/bin/git --git-dir=$HOME/code/dotfiles/.git --work-tree=$HOME'
git clone --separate-git-dir=$HOME/code/dotfiles/.git git@github.com:JRice/dotfiles.git /tmp/dotfiles-temp
rsync -a /tmp/dotfiles-temp/ $HOME/
rm -rf /tmp/dotfiles-temp
gitdot config --local status.showUntrackedFiles no
```
