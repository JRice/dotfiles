if command -v nvim > /dev/null 2>&1; then
    alias vim="nvim"
    export EDITOR="$(command -v nvim)"
else
    export EDITOR="$(command -v vim)"
fi

# OS-Specific changes

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS specific configurations
    echo "OS: MacOS"
fi

alias cd..="cd .."
alias dc="cd"
alias pd="pushd"
alias pop="popd"

# Editing dot files:
alias ealias='$EDITOR ~/.zshrc.d/80-aliases.zsh ; source ~/.zshrc.d/80-aliases.zsh'
alias ealiases="ealias"

# Git:
alias ggr='git grep -n --color'
alias gcpdone='git clean -f; git commit -m "Merge after cherry-pick"; git push'
alias mt='git mergetool'

# For editing the git in your homedir. ~/.git is a "gitdir:" pointer file, so
# read the real location from it (falling back to the old ~/code/dotfiles).
if [[ -f $HOME/.git ]]; then
  DOTFILES_GIT_DIR="$(sed -n 's/^gitdir: //p' $HOME/.git)"
else
  DOTFILES_GIT_DIR="$HOME/code/dotfiles/.git"
fi
alias gitdot='git --git-dir="$DOTFILES_GIT_DIR" --work-tree=$HOME'
alias gdp="gitdot pull"

# Fun stuff:
alias weather="curl -s 'v2d.wttr.in/01702'"

# History command sucks by default:
alias history='history 1'
