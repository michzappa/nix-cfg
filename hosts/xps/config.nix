{ config, pkgs, lib, ... }:

# This file wraps together all the parts of this host's configuration
{
  imports =
    [
      ../gnome.nix
      ../system.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "xps";
  networking.interfaces.wlp59s0.useDHCP = true;
  #networking.interfaces.ens20u1.useDHCP = true; -- ethernet turned off

  services.xserver.videoDrivers = [ "nvidia" ];
}
