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

  # install fish config
  programs.fish.shellInit = (builtins.readFile "${config.home.homeDirectory}/.config/home-manager/dotfiles/config/fish/config.fish");


  # Install .config files
  #home.file.".config/fish" = {
	#source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager//dotfiles/config/fish";
	#recursive = true;
  #};
  home.file.".config/helix" = { 
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/config/helix";
  };
  home.file.".config/zellij" = { 
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/config/zellij";
  };
  home.file.".config/nix" = {
	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/config/nix";
  };
 
  # Install bashrc 
  home.file.".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/bashrc";

  # Set shell environment variables
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = false;

  #Fish installation
  programs.fish.enable = true;

  #Allow nix-controlled fonts to be discovered
  fonts.fontconfig.enable = true;
}
