#
# ~/.bash_profile
# Profile file. Runs on login.
#

export PATH="$PATH:$HOME/.local/bin:$HOME/projects/scripts:$HOME/.yarn/bin"

# Set LAPTOP env variable which determines startup and config
if [ "$(cat /sys/class/dmi/id/chassis_type)" = "8" ] || [ "$(cat /sys/class/dmi/id/chassis_type)" = "9" ] || [ "$(cat /sys/class/dmi/id/chassis_type)" = "10" ]; then
   export LAPTOP=true
fi

export DISPLAY_LEFT="HDMI-0"
export DISPLAY_RIGHT="HDMI-1"

# Default programs
export BROWSER="firefox"
export WEB=$BROWSER
export WEBBROWSER=$BROWSER
export EDITOR="vim"
export PLAYER="vlc"
export TERMINAL="alacritty"
export TERMINFO="/usr/lib/terminfo"
export VIEWER="feh"
export WALLPAPER="$HOME/.wallpaper"

# Shortcut variables
export HDD="/mnt/hdd"
export BACKUP="$HDD/backup"
export DOCS="$HOME/documents"
export DOTS="$HOME/dotfiles"
export DW="$HOME/downloads"
export M="$HOME/music"
export P="$HOME/projects"
export PICS="$HOME/pictures"
export SC="$HOME/projects/scripts"
export SCR="$HOME/pictures/screenshots"
export VIDS="$HOME/videos"
export USB="/run/media/akomis"

# Prompt Configuration
export C0="$(tput setaf 0)"
export C1="$(tput setaf 1)"
export C2="$(tput setaf 2)"
export C3="$(tput setaf 3)"
export C4="$(tput setaf 4)"
export C5="$(tput setaf 5)"
export C6="$(tput setaf 6)"
export C7="$(tput setaf 7)"
export RESET="$(tput sgr0)"
export BOLD="$(tput bold)"


[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> /dev/null
fi
