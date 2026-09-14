#!/usr/bin/env bash
set -e

sudo apt install -y zsh stow git curl unzip
curl -s https://ohmyposh.dev/install.sh | bash -s -- -t ~/.cache/oh-my-posh

mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip && rm JetBrainsMono.zip && fc-cache -f

cd ~/dotfiles && stow zsh ohmyposh
chsh -s "$(which zsh)"
