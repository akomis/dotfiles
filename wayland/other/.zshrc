# ~/.zshrc

# Plugins
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt - grayscale
autoload -U colors && colors
PROMPT="%F{white}%~ %B%F{white}"

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
alias rw="railway"
alias pushProd="git checkout staging && git rebase development && git push --force && git checkout production && git rebase staging && git push --force && git checkout development"
alias pushDev="git checkout staging && git rebase production && git push --force && git checkout development && git rebase staging && git push --force && git checkout development"
