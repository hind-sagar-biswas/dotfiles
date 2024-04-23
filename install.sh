#!/usr/bin/env bash

# Variables
dotfiles=~/Git/dotfiles
config=~/.config

yay -Syu --noconfirm

# ML4W Dotfiles
mkdir ~/Downloads # If Downloads folder doesn't exists
wget -P ~/Downloads/ https://gitlab.com/stephan-raabe/dotfiles/-/raw/main/apps/ML4W_Dotfiles_Installer.AppImage
cd ~/Downloads
chmod +x ML4W_Dotfiles_Installer.AppImage
./ML4W_Dotfiles_Installer.AppImage

cd ~/Git

# Neovim
git clone https://github.com/hind-sagar-biswas/nvim.git
rm -rf $config/nvim
ln --symbolic ~/Git/nvim $config/nvim

# ZSH
yay -S --needed --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting
rm -f ~/.zshrc
ln --symbolic $dotfiles/.zshrc ~/.zshrc

# Tmux
yay -S --needed --noconfirm tmux
rm -f ~/.tmux.conf
ln --symbolic $dotfiles/.tmux.conf ~/.tmux.conf

# Profile
rm -f ~/.profile
ln --symbolic $dotfiles/.profile ~/.profile

# Neofetch
yay -S --needed --noconfirm neofetch
rm -rf $config/neofetch
ln --symbolic $dotfiles/neofetch $config/neofetch

# Qutebrowser
rm -rf $config/qutebrowser
ln --symbolic $dotfiles/qutebrowser $config/qutebrowser

# Btop
yay -S --needed --noconfirm btop
rm -rf $config/btop
ln --symbolic $dotfiles/btop $config/btop

# Kitty Terminal
yay -S --needed --noconfirm kitty
rm -rf $config/kitty
ln --symbolic $dotfiles/kitty $config/kitty

# Alacritty Terminal
yay -S --needed --noconfirm alacritty
rm -rf $config/alacritty
ln --symbolic $dotfiles/alacritty $config/alacritty

# Ranger
yay -S --needed --noconfirm ranger
rm -rf $config/ranger
ln --symbolic $dotfiles/ranger $config/ranger

# GTK
rm -rf $config/gtk-3.0
ln --symbolic $dotfiles/gtk-3.0 $config/gtk-3.0

# Scripts
rm -r ~/Scripts
git clone https://github.com/hind-sagar-biswas/linux-scripts.git ~/Git/linux-scripts
ln --symbolic ~/Git/linux-scripts ~/Scripts

# PHP Apache
yay -S needed --noconfirm composer php php-mbstring php-apache php-gd php-xsl php-pgsql php-sqlite phpmyadmin apache mariadb
sudo rm -rf /etc/httpd/conf/extra
sudo ln -s $dotfiles/httpd/conf/extra /etc/httpd/conf/extra
sudo rm -rf /etc/httpd/conf/httpd.conf
sudo ln -s $dotfiles/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf
sudo rm -f /etc/php/php.ini
sudo ln -s $dotfiles/php.ini /etc/php/php.ini
sudo systemctl enable httpd.service --now
sudo systemctl enable mariadb.service --now
mkdir -p ~/public_html/shin.com

# Hyprland
rm -f $config/hypr/conf/keybindings/default.conf
ln -s $dotfiles/hypr/default.conf $config/hypr/conf/keybindings/default.conf
