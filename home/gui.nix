{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
  ];
  programs.home-manager.enable = true;
}
