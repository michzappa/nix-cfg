{ config, pkgs, lib, ... }:

# This file contains configuration I expect on any computer I am using.
{
  imports =
    [
      <home-manager/nixos>
    ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useUserPackages = true;
    users.michael = import ./home/config.nix;
  };
  
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    supportedFilesystems = [ "ntfs" ];
  };
  
  networking = {
    networkmanager = {
      enable = true;  # Enables wireless support via network manager
    };
    useDHCP = false;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # time.timeZone = "America/New_York";
  time.timeZone = "America/Chicago";
  
  environment = {
    variables = { EDITOR = "vim"; };
  
    # bare minimum system packages
    systemPackages = with pkgs; [
      home-manager
      git
      wget
      vim
    ];
  };
  
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  sound.enable = true;
  hardware = {
    bluetooth = {
      enable = true;
    };

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
    };
  };

  services = {
    openssh.enable = true;
      
    printing = {
      enable = true;
      drivers = [pkgs.gutenprint pkgs.gutenprintBin pkgs.hplip pkgs.hplipWithPlugin];
    };
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
    };
  };

  programs.fish.enable = true;

  users.users.michael = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Michael Zappa";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
