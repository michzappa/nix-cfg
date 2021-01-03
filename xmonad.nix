{ config, lib, pkgs, ... }:

# System configuration for XMonad window manager
{
  services = {
    xserver = {
      enable = true;
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
      xkbOptions = "Caps_Lock=Escape";
    };

    blueman.enable = true;

    picom = {
      enable = true;
      activeOpacity = 1.0;
      inactiveOpacity = 1.0;
      backend = "glx";
      fade = true;
      fadeDelta = 5;
      shadow = true;
      shadowOpacity = 0.75;
    };    

  }; 
}
