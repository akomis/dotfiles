# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[${BOLD}${C6}\]> \[${RESET}${C5}\]\w \[${BOLD}${C3}\]\$ \[${RESET}\]"

export CWP="$THCD/front-page"
export RUN=""
export SND=""

# Aliases
alias cwp="cd $CWP"
alias feh="feh -d"
alias b="$BROWSER"
alias ls="ls --color=auto --group-directories-first"
alias lsm="ls -alth"
alias sizes="du -h --max-depth=1 | sort -hr"
alias gotop="gotop -a -c solarized16-dark"
alias pv="sudo protonvpn"
alias pvc="sudo protonvpn c -f"
alias pvd="sudo protonvpn d"
alias brc="$EDITOR $BRC"
alias bu="cd $BU"
alias cloud="cd $CLOUD"
alias docs="cd $DOCS"
alias dots="cd $DOTS"
alias dw="cd $DW"
alias m="cd $M"
alias p="cd $P"
alias pics="cd $PICS"
alias prof="$EDITOR $PROF"
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
alias sb=". $BRC"
