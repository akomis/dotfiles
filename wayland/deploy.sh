#!/bin/bash
set -euo pipefail

# Core system/utils
declare -a packages=(
  "base-devel"
  "stow"
  "git"
  "jq"
  "tldr"
  "rsync"
  "reflector"
  "pacman-contrib"
  "cronie"
)

# Shell
declare -a packages+=(
  "zsh"
  "zsh-autocomplete"
  "zsh-autosuggestions"
  "zsh-completions"
  "zsh-syntax-highlighting"
)

# Terminal/editor/browser/media/sysinfo
declare -a packages+=(
  "kitty"
  "neovim"
  "firefox"
  "vlc"
  "vlc-plugins-all"
  "signal-desktop"
  "thunderbird"
  "fastfetch"
  "libreoffice-fresh"
  "code"
)

# Fonts
declare -a packages+=(
  "noto-fonts"
  "noto-fonts-emoji"
  "noto-fonts-extra"
  "ttf-liberation"
  "ttf-dejavu"
  "cantarell-fonts"
  "otf-font-awesome"
  "woff2-font-awesome"
)

# Audio
declare -a packages+=(
  "pipewire"
  "pipewire-alsa"
  "pipewire-jack"
  "pipewire-pulse"
  "wireplumber"
  "pavucontrol"
)

# Networking/bluetooth/storage
declare -a packages+=(
  "networkmanager"
  "network-manager-applet"
  "bluez"
  "bluez-utils"
  "blueman"
  "udisks2"
  "udiskie"
  "gvfs"
  "gvfs-mtp"
)

# Files/utilities
declare -a packages+=(
  "thunar"
  "thunar-archive-plugin"
  "thunar-media-tags-plugin"
  "thunar-volman"
  "tumbler"
  "ffmpegthumbnailer"
  "qalculate-gtk"
  "gnome-keyring"
  "polkit-gnome"
  "nwg-look"
  "xdg-user-dirs"
)

# Wayland/Sway
declare -a packages+=(
  "waybar"
  "wofi"
  "swaylock"
  "mako"
  "grim"
  "slurp"
  "sway-contrib"
  "swaybg"
  "wl-clipboard"
  "wlr-randr"
  "xdg-desktop-portal"
  "xdg-desktop-portal-wlr"
  "xorg-xwayland"
  "lm_sensors"
)

# Theming build deps
declare -a packages+=(
  "sassc"
  "gtk-update-icon-cache"
)

# Optional laptop packages
declare -a laptop_packages=(
  "tlp"
  "acpi"
  "brightnessctl"
)

# AUR packages
declare -a aur_packages=(
  "spotify"
  "wl-color-picker"
  "swayfx"
)

# GPU driver -- adjust for your hardware:
# - nvidia-open-dkms : modern open NVIDIA module (extra repo)
# - nvidia-580xx-dkms: legacy NVIDIA 580xx (AUR)
# - amd/intel users can remove this line
# Using the open module as the default for a fresh NVIDIA machine.
declare -a packages+=(
  "linux-headers"
  "nvidia-open-dkms"
  "nvidia-utils"
  "nvidia-settings"
)

# Update system and repos
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S "${packages[@]}" --noconfirm

if [[ ${LAPTOP:-false} == true ]]; then
  sudo pacman -S "${laptop_packages[@]}" --noconfirm
fi

# Install AUR helper (paru)
if ! command -v paru >/dev/null 2>&1; then
  sudo rm -rf /opt/paru
  sudo git clone https://aur.archlinux.org/paru.git /opt/paru
  sudo chown -R "$(whoami):$(id -gn)" /opt/paru
  (
    cd /opt/paru
    makepkg -si --noconfirm
  )
fi

# Install AUR packages
paru -S "${aur_packages[@]}" --noconfirm

# Change default shell to zsh
chsh -s /bin/zsh

# Setup configuration files
rm -f ~/.bashrc ~/.bash_profile ~/.zshrc ~/.zprofile

# Clone or refresh dotfiles (with theme submodules)
if [[ -d ~/dotfiles ]]; then
  cd ~/dotfiles
  git pull || true
  git submodule update --init --recursive
else
  cd ~
  git clone --recursive https://github.com/akomis/dotfiles.git
  cd ~/dotfiles
fi

# Stow wayland packages
for dir in wayland/*/; do
  pkg=$(basename "$dir")
  stow -v -d wayland -t "$HOME" "$pkg"
done

# Build and install GTK/icon themes from the bundled sources
# (They are stowed as source; the install scripts compile them.)
if [[ -d ~/.themes/Graphite-gtk-theme ]]; then
  (
    cd ~/.themes/Graphite-gtk-theme
    ./install.sh --color dark
  )
fi

if [[ -d ~/.themes/Tela-circle-icon-theme ]]; then
  (
    cd ~/.themes/Tela-circle-icon-theme
    ./install.sh -c black
  )
fi

# Enable essential services
sudo systemctl enable --now NetworkManager bluetooth cronie

if [[ ${LAPTOP:-false} == true ]]; then
  sudo systemctl enable --now tlp
fi
