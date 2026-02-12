#!/bin/bash

declare -a packages=(
"kitty"
"pavucontrol"
"neofetch"
"firefox"
"wl-color-picker"
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
"neovim"
"zsh"
"vlc"
"jq"
"tldr"
"git"
"stow"
"linux-headers"
"nvidia-dkms"
"nvidia-utils"
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
"sway"
"waybar"
"wofi"
"swaylock"
"mako"
"grim"
"slurp"
"sway-contrib"
"wl-clipboard"
"swaybg"
"wlr-randr"
"fastfetch"
)

declare -a laptop_packages=(
"tlp"
"acpi"
)

declare -a aur_packages=(
"spotify"
)

# Update system and repos
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S ${packages[@]} --noconfirm

if [[ $LAPTOP == true ]]; then
    sudo pacman -S ${laptop_packages[@]} --noconfirm
fi

# Install AUR helper (paru)
cd /opt &&\
sudo git clone https://aur.archlinux.org/paru.git &&\
sudo chown -R "$(whoami)":"$(id -gn "$(whoami)")" ./paru
cd paru
makepkg -si

# Install AUR packages
paru -S ${aur_packages[@]}

# Change default shell to zsh
chsh -s /bin/zsh

# Setup configuration files
rm -f ~/.bashrc ~/.bash_profile ~/.zshrc ~/.zprofile
cd && git clone https://github.com/akomis/dotfiles.git
cd ~/dotfiles

for dir in wayland/*/; do
    pkg=$(basename "$dir")
    stow -v -d wayland -t "$HOME" "$pkg"
done
