if command -v nvim > /dev/null 2>&1; then
    alias vim="nvim"
    export EDITOR="/usr/bin/nvim"
else
    export EDITOR="/usr/bin/vim"
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
alias ealias="nvim ~/.bashrc.d/80-aliases.bash ; source ~/.bashrc.d/80-aliases.bash"
alias ealiases="ealias"

# Git:
alias ggr='git grep -n --color'
alias gcpdone='git clean -f; git commit -m "Merge after cherry-pick"; git push'
alias mt='git mergetool'

# For editing the git in your homedir:
alias gitdot='/usr/bin/git --git-dir=$HOME/code/dotfiles/.git --work-tree=$HOME'
alias gdp="gitdot pull"

# Fun stuff:
alias weather="curl -s 'v2d.wttr.in/01702'"
