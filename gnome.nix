{ config, pkgs, lib, ... }:

# Configuration for using the GNOME3 desktop environment. Further configuration
# is done via home-manager
{
  programs.gnome-terminal.enable = true;

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