{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../common.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "xps";
  networking.interfaces.wlp59s0.useDHCP = true;
  networking.interfaces.ens20u1.useDHCP = true;

}
