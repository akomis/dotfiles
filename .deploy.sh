#!/bin/bash

declare -a packages=(
"alacritty"
"atom"
"dunst"
"feh"
"ffmpeg-compat-57"
"firefox"
"flameshot"
"flat-remix-gtk"
"gcolor2"
"gnome-calculator"
"i3-gaps"
"i3lock"
"lxappearance"
"nextcloud-client"
"noto-fonts"
"noto-fonts-emoji"
"picom"
"polybar"
"protonmail-bridge"
"signal-desktop"
"spotify"
"thunderbird"
"ttf-liberation"
"ttf-weather-icons"
"udiskie"
"udisks2"
"vim"
"vlc"
"xorg"
"zathura"
"zenity"
)

# Install dependencies
sudo pacman -S base-devel git stow

# Install AUR helper (yay)
cd /opt &&/
sudo git clone https://aur.archlinux.org/yay.git &&/
sudo chown -R "$(whoami)":"$(id -gn "$(whoami)")" ./yay
cd yay
makepkg -si

# Update system and repos
sudo pacman -Syu

# Install packages
yay -S ${packages[@]}

# Setup configuration
cd && git clone https://github.com/akomis/dotfiles.git
cd ~/dotfiles &&\
for dir in *
do
    if [ -d "$dir" ]
    then
        stow -v $dir
    fi
done
