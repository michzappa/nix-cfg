{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./emacs
  ];
  programs.home-manager.enable = true;
}
