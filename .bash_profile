# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

[[ -z $DISPLAY ]] && exec startx

export PATH="$HOME/.cargo/bin:$PATH"
