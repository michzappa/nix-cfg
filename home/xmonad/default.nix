{ config, lib, pkgs, ... }:

{
  home.file = {
    ".scripts" = {
    source = ./scripts;
    recursive = true;
    };

    ".xmobarrc".source = ./.xmobarrc.hs; 
  };

  xsession = {
    enable = true;

    windowManager.xmonad = {
      enable = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
      config = ./xmonad.hs;
    };

  }; 

  home.packages = with pkgs; [
    haskellPackages.xmobar
    # nitrogen
    # picom
    # networkmanagerapplet
    # blueman
    # pasystray
    # trayer
    # playerctl
    # rofi
    # conky
    light
  ];
} 
