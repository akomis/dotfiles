#
# ~/.bash_profile
# Profile file. Runs on login.
#

export PATH="$PATH:$HOME/.local/bin:$HOME/projects/scripts"

# Default programs
export BROWSER="firefox"
export EDITOR="vim"
export PLAYER="vlc"
export READER="zathura"
export TERMINAL="alacritty"
export TERMINFO="/usr/lib/terminfo"
export VIEWER="feh"


# Shortcut variables
export BRC="$HOME/.bashrc"
export BU="/mnt/hdd/backup"
export CLOUD="$HOME/nextcloud"
export DOCS="$HOME/documents"
export DOTS="$HOME/dotfiles"
export DW="$HOME/downloads"
export M="$HOME/music"
export P="$HOME/projects"
export PICS="$HOME/pictures"
export PROF="$HOME/.bash_profile"
export SC="$HOME/projects/scripts"
export SCR="$HOME/pictures/screenshots"
export THC="$HOME/projects/thc"
export THCD="$HOME/projects/thc/dev"
export THCDOCS="$HOME/projects/thc/docs"
export THCPICS="$HOME/projects/thc/pics"
export VIDS="$HOME/videos"
export THCSERVER="thehotcharcoalers.com"


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
