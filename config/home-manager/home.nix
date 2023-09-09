{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about your user
  home.username = "dsmith";
  home.homeDirectory = "/home/dsmith";

  # You should not change this value, even if you update Home Manager. 
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages
  home.packages = [
    pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  # Set shell environment variables
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #Fish installation
  programs.fish.enable = true;

  #Allow nix-controlled fonts to be discovered
  fonts.fontconfig.enable = true;
}
