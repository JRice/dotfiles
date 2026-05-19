if command -v nvim &> /dev/null; then
    alias vi="nvim"
    export EDITOR="/usr/bin/nvim"
else
    alias vi="vim"
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

# Git:
alias ggr='git grep -n --color'
alias gcpdone='git clean -f; git commit -m "Merge after cherry-pick"; git push'
alias mt='git mergetool'

# For editing the git in your homedir:
alias gitdot='/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME'
gitdot config --local status.showUntrackedFiles no

# Fun stuff:
alias weather="curl -s 'v2d.wttr.in/01702'"
