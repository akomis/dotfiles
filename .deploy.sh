#!/bin/bash

user="$(whoami)"

# Install dependencies
sudo pacman -S base-devel git stow

# Install AUR helper (yay)
cd /opt &&/
sudo git clone https://aur.archlinux.org/yay.git &&/
sudo chown -R $user:"$(id -gn $user)" ./yay
cd yay
makepkg -si

# Update system and repos
sudo pacman -Syu

# Install packages
yay -S $(cat packages.txt)

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
