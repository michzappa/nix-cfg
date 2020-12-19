{ config, pkgs, lib, ... }:

# Configuration for using the GNOME3 desktop environment.
{
  programs.gnome-terminal.enable = true;

  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    gnome3.gnome-terminal
    gnome3.nautilus
    gnomeExtensions.appindicator
  ]

  services = {
    dbus.packages = [ pkgs.gnome3.dconf ];

    gnome3 = {
      core-utilities.enable = false;
    };

    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];

    xserver = {
      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };
  };
}