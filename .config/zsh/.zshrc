autoload -U colors && colors
PS1="%B%{$fg[blue]%}[%{$fg[green]%}%n%{$fg[magenta]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export PATH=$PATH:/home/sloth/.local/bin

export VISUAL=ewrap
export EDITOR=nvim

export _JAVA_AWT_WM_NONREPARENTING=1

fpath=(~/.config/zsh $fpath)
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY


# FZF
source ~/.config/zsh/completion.zsh
source ~/.config/zsh/key-bindings.zsh
export FZF_DEFAULT_COMMAND='fd --type f -L'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND='fd -L --type d --type symlink'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Cargo
source ~/.cargo/env

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
