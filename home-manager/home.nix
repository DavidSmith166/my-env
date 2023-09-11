{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about your user
  home.username = "{username}";
  home.homeDirectory = "/home/{username}";

  # You should not change this value, even if you update Home Manager. 
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages
  home.packages = with pkgs; [

    #fonts
    (nerdfonts.override { fonts = [ "Hack" ]; })
    
    #rust
    cargo rustc rust-analyzer rustfmt

    #python
    python310Full python310Packages.python-lsp-server

    #tools
    helix fd eza ripgrep zellij

    #nix
    nil  

    #docker
    nodePackages_latest.dockerfile-language-server-nodejs  

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config".source = dotfiles/config;
    ".bashrc".source = dotfiles/bashrc;
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
