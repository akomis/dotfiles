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
alias hdd="cd $HDD"
alias bu="cd $BACKUP"
alias docs="cd $DOCS"
alias dots="cd $DOTS"
alias dw="cd $DW"
alias m="cd $M"
alias p="cd $P"
alias pics="cd $PICS"
alias sc="cd $SC"
alias scr="cd $SCR"
alias usys="paru -Syu --noconfirm"
alias vids="cd $VIDS"
alias usb="cd $USB"
alias proton-authenticator="WEBKIT_DISABLE_COMPOSITING_MODE=1 proton-authenticator"
alias playall="ls -v *.wav *.mp3 *.mp4 | xargs vlc"
