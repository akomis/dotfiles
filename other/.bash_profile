#
# ~/.bash_profile
# Profile file. Runs on login.
#

export PATH="$PATH:$HOME/.local/bin:$HOME/projects/scripts:$HOME/.config/termite"
export EDITOR="vim"
export TERMINAL="termite"
export TERMINFO="/usr/lib/terminfo"
export TERM="xterm-color"
export BROWSER="firefox"
export BACKUP="/mnt/hdd/backup"
export CLOUD="$HOME/nextcloud"
export READER="zathura"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> /dev/null
fi
