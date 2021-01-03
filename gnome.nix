{ config, pkgs, lib, ... }:

# Configuration for using the GNOME3 desktop environment.
{
  programs.gnome-terminal.enable = true;

  environment.systemPackages = with pkgs; [
    gnome3.file-roller
    gnome3.gnome-tweaks
    gnome3.gnome-terminal
    gnome3.nautilus
    gnomeExtensions.appindicator
    # nordic # gtk theme, now handled in home/gtk.nix
  ];

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

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin ];
  };
}
