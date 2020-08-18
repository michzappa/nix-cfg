{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  home-manager.useUserPackages = true;
  home-manager.users.michael = import ./home/config.nix;
  nixpkgs.config.allowUnfree = true;
  
  services.dbus.packages = with pkgs; [ blueman ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  
  networking.hostName = "desktop"; # Define your hostname.
  networking.networkmanager.enable = true;  # Enables wireless support via network manager

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    emacs
    git
    home-manager
    neofetch
    networkmanager
    spotify
    teams
    libreoffice
    jetbrains.idea-ultimate
    signal-desktop
    bitwarden
    unetbootin

    # Utilities for XMonad
    haskellPackages.xmobar
    xfce.thunar
    kitty
    nitrogen
    picom
    networkmanagerapplet
    blueman
    pasystray
    trayer
    playerctl
    rofi
    redshift
    conky
    breeze-gtk
    arc-theme
    arc-kde-theme
    lxappearance
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [pkgs.gutenprint pkgs.gutenprintBin pkgs.hplip pkgs.hplipWithPlugin];
  };

  # Enable sound and bluetooth.
  sound.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  users.users.michael = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}

