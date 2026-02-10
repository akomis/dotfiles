#!/bin/bash

declare -a packages=(
"alacritty"
"pavucontrol"
"neofetch"
"firefox"
"gcolor3"
"gnome-keyring"
"nwg-look"
"noto-fonts"
"noto-fonts-emoji"
"signal-desktop"
"thunderbird"
"ttf-liberation"
"woff2-font-awesome"
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
"qalculate-gtk"
"i3-gaps"
"i3lock"
"picom"
"dmenu"
"feh"
"flameshot"
"dunst"
)

declare -a laptop_packages=(
"tlp"
"acpi"
)

declare -a aur_packages=(
"protonmail-bridge"
"spotify"
"gotop"
"cava"
"polybar"
)

# Update system and repos
sudo pacman -Syu --noconfirm

# Install packages
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
rm -f ~/.bashrc ~/.bash_profile
cd && git clone https://github.com/akomis/dotfiles.git
cd ~/dotfiles

for dir in x11/*/; do
    pkg=$(basename "$dir")
    stow -v -d x11 -t "$HOME" "$pkg"
done
