#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias feh="feh -d"
alias c="cd ~/.config;ls"
alias ls="ls --color=auto --group-directories-first"
alias lsm="ls -alth"
alias sizes="du -h --max-depth=1 | sort -hr"
alias usys="yay"
alias m="cd ~/music/personal;ls"
alias p="cd ~/projects;ls"
alias uni="cd ~/documents/uni;ls"
alias dw="cd ~/downloads;ls"
alias dc="cd ~/documents;ls"
alias sc="cd ~/projects/scripts;ls"
alias dots="cd ~/projects/dotfiles;ls"
alias brc="vim ~/.bashrc"
alias i3c="vim ~/.config/i3/config"
alias csh="cd ~/documents/cheatsheets;ls"
alias todo="cat ~/.todo"
alias lol="sudo sh -c 'sysctl -w abi.vsyscall32=0'"
alias vpnstart="sudo systemctl start openvpn-client@client.service"
alias vpnstop="sudo systemctl stop openvpn-client@client.service"

# Current Working Path
export CWP="$HOME/projects/" 
alias cwp="cd $CWP"
alias run=""
alias snd=""

# Bash Prompt Configuration
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


