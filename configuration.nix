{ config, lib, pkgs, ... }:

{
  imports = [
    ./host/hardware-configuration.nix
    ./host/config.nix
  ]; 
}
