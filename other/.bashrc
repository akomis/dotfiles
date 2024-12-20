# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/nvm/init-nvm.sh

export PS1="\[${RESET}${C5}\]\w \[${BOLD}${C3}\]\$ \[${RESET}\]"

export CWP="$P"

# Aliases
alias cwp="cd $CWP"
alias feh="feh -d"
alias b="$BROWSER"
alias ls="ls --color=auto --group-directories-first"
alias lsm="ls -alth"
alias sizes="du -h --max-depth=1 | sort -hr"
alias gotop="gotop -a -c solarized16-dark"
alias pv="protonvpn-cli"
alias pvc="protonvpn-cli c -f"
alias pvd="protonvpn-cli d"
alias hdd="cd $HDD"
alias bu="cd $BACKUP"
alias docs="cd $DOCS"
alias dots="cd $DOTS"
alias dw="cd $DW"
alias m="cd $M"
alias p="cd $P"
alias pics="cd $PICS"
alias prof="$EDITOR $PROF"
alias sc="cd $SC"
alias scr="cd $SCR"
alias usys="yes | yay"
alias vids="cd $VIDS"
alias usb="cd $USB"
alias c="git commit -m"
alias gpus="git push"
alias gpul="git pull"
alias gpub="git rev-parse --abbrev-ref HEAD | xargs git push --set-upstream origin"
alias playall="ls -v *.wav *.mp3 *.mp4 | xargs vlc"
alias sctl="systemctl"
alias portrait="xrandr --output DVI-D-0 --off --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rate 144 --rotate normal --output HDMI-1 --mode 2560x1440 --pos 2560x0 --rate 144 --rotate right --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off && feh --bg-scale $WALLPAPER"
alias landscape="xrandr --output DVI-D-0 --off --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rate 144 --rotate normal --output HDMI-1 --mode 2560x1440 --pos 2560x0 --rate 144 --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off && feh --bg-scale $WALLPAPER"
alias rw="railway"