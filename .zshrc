ZVM_INIT_MODE=sourcing
autoload -U colors && colors
#PS1='%n@%m %/ $ '
PS1="%B%{$fg[blue]%}[%{$fg[green]%}%n%{$fg[magenta]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[blue]%}]%{$reset_color%}$%b "

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
export _JAVA_AWT_WM_NONREPARENTING=1
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export EDITOR=/usr/bin/nvim

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt SHARE_HISTORY

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
