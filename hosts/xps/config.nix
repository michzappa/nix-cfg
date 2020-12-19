{ config, pkgs, lib, ... }:

# This file wraps together all the parts of this host's configuration
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
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

  environment.systemPackages = [ nvidia-offload ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia.prime = {
    offload.enable = true;

    intelBusId = "PCI:0:2:0";

    nvidiaBusId = "PCI:1:0:0";
  };
}
