{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    # ./bash.nix
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

  home.file.".config/rofi" = {
    source = ./rofi;
    recursive = true;
  };

  home.file.".config/kitty" = {
    source = ./kitty;
    recursive = true;
  };
}
