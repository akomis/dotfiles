# dotfiles
Various configuration files for Linux programs such as
- i3
- vim
- bash
- cava
- dunst
- termite
- polybar
- neofetch  
and others

This dotfiles repository is structured specifically to be managed by [GNU Stow](https://www.gnu.org/software/stow/)

<div align="center">
    <img src="./.screenshot">
</div>

## Config Replication
If you wish to replicate this setup on your machine follow these procedures

- Acquire dependencies  
`sudo pacman -S git stow`

- Clone this repository to your home directory  
`cd && git clone THIS_REPOSITORY`  

- Run stow inside the dotfiles directory  
`cd dotfiles && rm README.md && stow *`

If a conflict error occurs delete all the conflicting files from your home directory and beyond.
