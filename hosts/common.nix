{ config, pkgs, lib, ... }:

{
  imports =
    [
      <home-manager/nixos>
    ];

  home-manager.useUserPackages = true;
  home-manager.users.michael = import ../home/config.nix;
  nixpkgs.config.allowUnfree = true;
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  
  networking.networkmanager.enable = true;  # Enables wireless support via network manager
  networking.useDHCP = false;

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
  time.timeZone = "America/New_York";

  services.emacs.enable = true;
  
  environment.variables = { EDITOR = "vim"; };
  
  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
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
    gparted
    dconf2nix
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
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };

  services = {

    xserver = {
      enable = true;
      layout = "us";

      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };

      dbus.packages = [ pkgs.gnome3.dconf ];
      udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
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
