#!/usr/bin/env bash
rm -r ~/.config/home-manager
mkdir -p ~/.config/home-manager
cp -r home-manager ~/.config/
sed -i "s/{username}/${USER}/" ~/.config/home-manager/home.nix
sed -i "s/{username}/${USER}/" ~/.config/home-manager/dotfiles/cargo/config.toml
