{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home.file.".xmonad" = {
    source = ./xmonad;
    recursive = true;
  };

  home.file.".scripts" = {
    source = ./scripts;
    recursive = true;
  };

  home.file.".fonts" = {
    source = ./fonts;
    recursive = true;
  };

  home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
  };
}
