{pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./bash.nix
    ./emacs
  ];

  programs.home-manager.enable = true;
}
