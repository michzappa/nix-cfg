# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
    ];

  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/46039aef-b6ab-4803-a5e9-8277bcb0bb7e";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/b41d477b-c0d0-4a2d-8a22-c620c168584e"; }
    ];

  nix.maxJobs = lib.mkDefault 12;
}