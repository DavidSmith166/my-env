#!/usr/bin/env bash
mkdir -p ~/.config/home-manager
sed "s/{username}/${USER}/" home.nix > ~/.config/home-manager/home.nix
cp -r dotfiles ~/.config/home-manager/dotfiles
