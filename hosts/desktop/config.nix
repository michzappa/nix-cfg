{ config, pkgs, lib, ... }:

# This file wraps together all the parts of this host's configuration
{
  imports =
    [
      ../gnome.nix
      ../system.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "desktop"; # Define your hostname.
  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
}
