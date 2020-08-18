{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bash.nix
    ./rofi.nix
    ./emacs
    ./xmonad
  ];

  programs.home-manager.enable = true;

  home.file.".scripts" = {
    source = ./scripts;
    recursive = true;
  };

  # home.file.".config/rofi" = {
  #   source = ./rofi;
  #   recursive = true;
  # };

  home.file.".config/kitty" = {
    source = ./kitty;
    recursive = true;
  };
}
