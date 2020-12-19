{config, pkgs, lib, ... }:

{
  imports = [
    ./dconf.nix
    ./fish.nix
    ./emacs
    ./git.nix
    #./gnome-terminal.nix
    ./vim.nix
    ./vscode.nix
  ];

  programs.home-manager.enable = true;
  #programs.gnome-terminal.enable = true;

  home.packages = with pkgs; [
    #Utilities
    neofetch
    gparted
    #dconf2nix - put back in after a new release

    # Apps
    bitwarden
    discord
    firefox
    jetbrains.idea-ultimate
    jetbrains.clion
    libreoffice
    signal-desktop
    spotify
    steam
    teams

    #GNOME
    gnome3.gnome-tweaks
    gnome3.gnome-terminal
    gnome3.nautilus
    gnomeExtensions.appindicator
  ];
}
