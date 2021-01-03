{config, pkgs, lib, ... }:

{
  imports = [
    ./dconf.nix
    ./emacs
    ./git.nix
    ./gtk.nix
    ./vim.nix
    ./vscode.nix
    ./udiskie.nix
    #./xmonad
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  services.network-manager-applet.enable = true;

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
    # steam - doesn't work well/at all, don't really want it anyways
    teams

    # Programming
    rustc
    cargo
  ];
}
