{pkgs, lib, ... }:

{
  imports = [
    ./bash.nix
    ./dconf.nix
    ./emacs
    ./git.nix
    ./vim.nix
    ./vscode.nix
  ];

  programs.home-manager.enable = true;
}
