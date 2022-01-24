#!/bin/sh

# xinitrc runs automatically when you run startx.

# Line below sources to prevent doubling commands.

[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
sxhkd &
exec bspwm 
