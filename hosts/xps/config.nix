{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../hosts/common.nix
    ];

  networking.hostName = "xps";
  networking.interfaces.wlp59s0.useDHCP = true;
  networking.interfaces.ens20u1.useDHCP = true;

}
