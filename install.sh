#!/usr/bin/env bash
mkdir -p ~/.config/home-manager
sed "s/{username}/${USER}/" home-manager/home.nix > ~/.config/home-manager/home.nix
cp -r home-manager/dotfiles ~/.config/home-manager/dotfiles
