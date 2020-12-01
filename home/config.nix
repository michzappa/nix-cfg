{pkgs, lib, ... }:

{
  imports = [
    ./bash.nix
    ./dconf.nix
    ./git.nix
    ./vim.nix
    ./emacs
  ];

  programs.home-manager.enable = true;
}
