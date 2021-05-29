#!/bin/bash
# Kyli0x's Artix, xfce & openrc installation script
# by Kyli0x
# License: GNU GPLv3

# Define colors
RED=`tput bold && tput setaf 1`
CYAN=`tput bold && tput setaf 6`
NC=`tput sgr0`

function RED(){
    echo -e "\n${RED}${1}${NC}"
}
function CYAN(){
    echo -e "\n${CYAN}${1}${NC}"
}

CYAN "Updating System"
cd
sudo pacman --noconfirm -Syu

CYAN "Installing rice packages"
sudo pacman --noconfirm -S papirus-icon-theme breeze noto-fonts

CYAN "Installing base-devel"
sudo pacman --noconfirm -S base-devel

CYAN "Installing locate"
sudo pacman --noconfirm -S mlocate

CYAN "Updating db"
sudo updatedb

CYAN "Installing the git"
sudo pacman --noconfirm -S git

CYAN "Installing Compression Tools"
sudo pacman --noconfirm -S zip unzip unrar p7zip lzop

CYAN "Installing pip3"
sudo pacman --noconfirm -S python-pip

CYAN "Installing perl"
sudo pacman --noconfirm -S perl

CYAN "Installing vim"
sudo pacman --noconfirm -S vim

CYAN "Installing Wireshark"
sudo pacman --noconfirm -S wireshark-qt

CYAN "Installing Console Network Tools"
sudo pacman --noconfirm -S traceroute nmap

CYAN "Installing yay"
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R kyli0x:kyli0x ./yay-git
cd yay-git
makepkg -si
cd

CYAN "Installing openvpn & resolv-conf"
sudo pacman --noconfirm -S openvpn-openrc
yay --noconfirm -S openvpn-update-resolv-conf-git

CYAN "Installing brave"
yay --noconfirm -S brave-bin

CYAN "Installing a few packages for rust"
sudo pacman --noconfirm -S cmake freetype2 fontconfig pkg-config make libxcb gcc

CYAN "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
source ~/.profile
rustup override set stable
rustup update stable

CYAN "Installing Alacritty"
sudo pacman --noconfirm -S alacritty

# install zsh
sudo pacman --noconfirm -S zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting

CYAN "Installing & updating my personal dotfiles"
git clone https://github.com/kyli0x/kyricer.git
cd kyricer/
chmod +x install.sh
./install.sh
cd ..
rm -rf kyricer/
cd





Setting up Neovim:

$ nvim ~/.config/nvim/vim-plug/plugins.vim
$ :wq
$ nvim plguins.vim
PlugInstall
$ :wq












