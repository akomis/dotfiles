xrandr --output $DISPLAY_LEFT --primary --mode 2560x1440 --pos 0x0 --rate 144 --rotate normal --output $DISPLAY_RIGHT --mode 2560x1440 --pos 2560x0 --rate 144
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3
