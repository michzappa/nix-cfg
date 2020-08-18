{ config, lib, pkgs, ... }:

{
  xsession.windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
      config = ./xmonad.hs;
    };

  home.file.".xmonad/xmobarrc.hs" = {
    source = ./xmobarrc.hs;
    recursive = true;
  };
}
