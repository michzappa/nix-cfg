{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ../hardware-configuration.nix
    ];

  networking.hostName = "desktop"; # Define your hostname.
  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;
}
