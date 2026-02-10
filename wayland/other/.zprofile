#
# ~/.zprofile
# Profile file. Runs on login.
#

export PATH="$PATH:$HOME/.local/bin:$HOME/projects/scripts:$HOME/.yarn/bin"

# Wayland environment
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# NVIDIA Wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Default programs
export BROWSER="firefox"
export WEB=$BROWSER
export WEBBROWSER=$BROWSER
export EDITOR="vim"
export PLAYER="vlc"
export TERMINAL="kitty"
export TERMINFO="/usr/lib/terminfo"
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

if [[ -z $DISPLAY && -z $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec sway --unsupported-gpu 2> ~/.sway.log
fi
