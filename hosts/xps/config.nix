{ config, lib, pkgs, ... }:

{
  networking.useDHCP = false;
  networking.hostName = "xps";
  networking.interfaces.wlp59s0.useDHCP = true;
  networking.interfaces.ens20u1.useDHCP = true;
}
