# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR="/usr/bin/nvim"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias xin='sudo xbps-install -S'
alias xup='sudo xbps-install -Suv'
alias xq='sudo xbps-query'
alias xf='sudo xbps-query -Rs'
alias xme='sudo xbps-query -m'
alias xrm='sudo xbps-remove -R'
alias xcp='sudo xbps-remove -Oo'

alias mp3="youtube-dl -x --embed-thumbnail --audio-format mp3"


function mkcd() {
    mkdir -p "$*"
    cd "$*"
}

source $HOME/.config/fzf/key-bindings.bash
source /home/sloth/.cargo/env
alias config='/usr/bin/git --git-dir=/home/sloth/.cfg/ --work-tree=/home/sloth'
