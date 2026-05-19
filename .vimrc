" Tell vanilla Vim to read Neovim's configuration file
set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath

source ~/.config/nvim/init.vim
