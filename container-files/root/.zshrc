export EDITOR=vim
export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
