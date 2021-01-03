{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita-dark";
      package = pkgs.gnome3.adwaita-icon-theme;
    };
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
  };
}
