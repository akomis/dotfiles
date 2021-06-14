#
# ~/.bash_profile
# Profile file. Runs on login.
#

export PATH="$PATH:$HOME/.local/bin:$HOME/projects/scripts:$HOME/.config/termite"

# Default programs
export EDITOR="atom"
export TERMINAL="termite"
export TERMINFO="/usr/lib/terminfo"
export TERM="xterm-color"
export BROWSER="firefox"
export READER="zathura"
export VIEWER="feh"


# Shortcut variables
export CWP="$THCD/api"
export RUN=""
export SND=""
export BRC="$HOME/.bash_profile"
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
export SCR="$HOME/screenshots"
export THC="$HOME/projects/thc"
export THCD="$HOME/projects/thc/dev"
export THCDOCS="$HOME/projects/thc/docs"
export THCPICS="$HOME/projects/thc/pics"
export VIDS="$HOME/videos"
export THCSERVER="thehotcharcoalers.com"


# Aliases
alias feh="feh -d"
alias f="firefox"
alias ls="ls --color=auto --group-directories-first"
alias lsm="ls -alth"
alias sizes="du -h --max-depth=1 | sort -hr"
alias gotop="gotop -a -c solarized16-dark"
alias brc="$EDITOR $BRC"
alias bu="cd $BACKUP"
alias cloud="cd $CLOUD"
alias docs="cd $DOCS"
alias dots="cd $DOTS"
alias dw="cd $DW"
alias m="cd $M"
alias p="cd $P"
alias pics="cd $PICS"
alias prof="$EDITOR $PROF"
alias rp=". $PROFILE"
alias sc="cd $SC"
alias scr="cd $SCR"
alias sshthc="ssh root@$THCSERVER"
alias thc="cd $THC"
alias thcd="cd $THCD"
alias thcdocs="cd $THCDOCS"
alias thcpics="cd $THCPICS"
alias usys="yes | yay"
alias vids="cd $VIDS"
alias sp=". $PROF"


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
export PS1="\[${BOLD}${C6}\]> \[${RESET}${C5}\]\w \[${BOLD}${C3}\]\$ \[${RESET}\]"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx 2> /dev/null
fi
