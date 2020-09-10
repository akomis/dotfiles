# dotfiles
Various Configuration Files for Linux programs such as
- i3
- vim
- cava
- dunst
- termite
- polybar
- neofetch  
and others

This dotfiles repository is structured specifically to be managed by [GNU Stow](https://www.gnu.org/software/stow/)

## Config Replication
If you wish to replicate this setup on your machine follow these procedures

- Acquire dependencies  
`sudo pacman -S git stow`

- Clone a fork of this repository to your home directory  
`cd && git clone [your fork repository]`

- Run stow inside the dotfiles directory  
`cd dotfiles && stow *`

If a conflict error occurs delete all the conflicting files from your home directory and beyond.
