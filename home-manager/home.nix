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
    cargo rustc rust-analyzer rustfmt mold clang

    #python
    python310Full python310Packages.python-lsp-server

    #tools
    helix fd eza ripgrep zellij starship bat

    #nix
    nil  

    #docker
    nodePackages_latest.dockerfile-language-server-nodejs  

  ];

 home.file.".config/helix" = { 
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/helix";
  };
  home.file.".config/zellij" = { 
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/zellij";
  };
  home.file.".config/nix" = {
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/nix";
  };
  home.file.".cargo" = {
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/cargo";
  };
 
  # Set shell environment variables
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = false;

  # Fish installation
  programs.fish.enable = true;
  programs.fish.shellInit = (builtins.readFile "${config.home.homeDirectory}/.config/home-manager/dotfiles/fish/shell-init.fish");
  programs.fish.shellAliases = {
    ls = "eza";
    tree = "eza --tree";
    cat = "bat";
  };

  # Bash installation
  programs.bash.enable = true;
  programs.bash.bashrcExtra = (builtins.readFile "${config.home.homeDirectory}/.config/home-manager/dotfiles/bash/shell-init.bash");

  #Allow nix-controlled fonts to be discovered
  fonts.fontconfig.enable = true;
}
