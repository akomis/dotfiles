# dotfiles

Various configuration files for Linux software such as

- i3
- vim
- bash
- cava
- dunst
- picom
- polybar
- alacritty  
  and others

This dotfiles repository is structured specifically to be managed by [GNU Stow](https://www.gnu.org/software/stow/)

![image](https://github.com/user-attachments/assets/ae589591-f286-40ef-a68c-505c87916b4b)

## Config Replication

If you wish to replicate this setup on your machine follow these procedures

- Acquire dependencies  
  `sudo pacman -S git stow`

- Clone this repository to your home directory  
  `cd && git clone THIS_REPOSITORY`

- Run stow on the dotfiles directory  
  `cd ~/dotfiles && for dir in *; do if [ -d "$dir" ]; then stow -v $dir; fi; done`

If a conflict error occurs delete all the conflicting files from your home directory and beyond.
