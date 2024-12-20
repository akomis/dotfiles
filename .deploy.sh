#!/bin/bash

declare -a packages=(
"alacritty"
"dunst"
"dmenu"
"pavucontrol"
"neofetch"
"feh"
"firefox"
"flameshot"
"gcolor3"
"gnome-calculator"
"gnome-keyring"
"i3-gaps"
"i3lock"
"nwg-look"
"noto-fonts"
"noto-fonts-emoji"
"picom"
"signal-desktop"
"thunderbird"
"ttf-liberation"
"ttf-font-awesome"
"udisks2"
"udiskie"
"vim"
"vlc"
"jq"
"tldr"
"git"
"stow"
"rsync"
"cronie"
"dhcpcd"
"reflector"
"pacman-contrib"
"libreoffice"
"code"
"bluez"
"bluez-utils"
"blueman"
"thunar"
"thunar-media-tags-plugin"
"thunar-volman"
"tumbler"
"ffmpegthumbnailer"
)

declare -a laptop_packages=(
"tlp"
"acpi"
)

declare -a aur_packages=(
"polybar"
"protonmail-bridge"
"spotify"
"ttf-weather-icons"
"gotop"
"cava"
"nvm"
)

# Update system and repos
sudo pacman -Syu --noconfirm

# Install packages from official repos
sudo pacman -S ${packages[@]} --noconfirm

if [[ $LAPTOP == true ]]; then
    sudo pacman -S ${laptop_packages[@]} --noconfirm
fi

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
