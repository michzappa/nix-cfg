{ config, pkgs, lib, ... }:

{
  programs.gnome-terminal.enable = true;

  services = {
    dbus.packages = [ pkgs.gnome3.dconf ];

    gnome3 = {
      core-utilities.enable = false;
    };

    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];

    xserver = {
      enable = true;
      layout = "us";

      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };
  };
}