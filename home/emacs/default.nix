{ config, lib, pkgs, ... }:
let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
   url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
 }) {
   doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                               # and packages.el files
   extraPackages = epkgs: (with epkgs.melpaPackages; [ request ]);
 };
in {
  home.packages = with pkgs; [
    emacs-all-the-icons-fonts
    fira-code-symbols
  ];
  
  programs.emacs = {
    enable = true;
    package = doom-emacs;
  };
} 
