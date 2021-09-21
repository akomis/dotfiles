#!/bin/bash

declare -a packages=(
"alacritty"
"atom"
"dunst"
"dmenu"
"xorg-server"
"xorg-xinit"
"pulseaudio"
"pavucontrol"
"neofetch"
"feh"
"firefox"
"flameshot"
"gcolor2"
"gnome-calculator"
"gnome-keyring"
"i3-gaps"
"i3lock"
"lxappearance"
"nextcloud-client"
"noto-fonts"
"noto-fonts-emoji"
"picom"
"signal-desktop"
"thunderbird"
"ttf-liberation"
"ttf-font-awesome"
"udiskie"
"udisks2"
"vim"
"vlc"
"zathura"
"zathura-pdf-poppler"
"jq"
"tldr"
"git"
"stow"
"rsync"
"cronie"
"dhcpcd"
"reflector"
"pacman-contrib"
"liquidctl"
"libreoffice"
"nvidia"
)

declare -a aur_packages=(
"joplin-desktop"
"polybar"
"flat-remix"
"flat-remix-gtk"
"protonmail-bridge"
"spotify"
"ffmpeg-compat-57"
"ttf-weather-icons"
"gotop"
"cava"
"protonvpn"
)

# Update system and repos
sudo pacman -Syu --noconfirm

# Install packages from official repos
sudo pacman -S ${packages[@]} --noconfirm

# Install AUR helper (yay)
cd /opt &&\
sudo git clone https://aur.archlinux.org/yay.git &&\
sudo chown -R "$(whoami)":"$(id -gn "$(whoami)")" ./yay
cd yay
makepkg -si

# Install AUR packages
yay -S ${aur_packages[@]}

# Setup configuration files
rm ~/.bashrc ~/.bash_profile
cd && git clone https://github.com/akomis/dotfiles.git
cd ~/dotfiles &&\
for dir in *
do
    if [ -d "$dir" ]
    then
        stow -v $dir
    fi
done
