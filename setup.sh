#!/bin/bash

echo "🚀 Setting up Neovim..."

# Install dependencies
sudo apt update
sudo apt install -y git curl xclip ripgrep fd-find fonts-powerline

# Fix fd
ln -s $(which fdfind) ~/.local/bin/fd 2>/dev/null || true

# Install Neovim latest
sudo apt remove neovim -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y neovim

# Setup config
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim

cp init.lua ~/.config/nvim/init.lua

# Install plugins
nvim +"Lazy sync" +qa

echo "🎉 DONE! Neovim ready 🚀"