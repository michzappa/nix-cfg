{ config, pkgs, lib, ... }:

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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # input methods for chinese and japanese. don't show up on GNOME or in fcitx-config
    # inputMethod = {
    #   enabled = "fcitx";
    #   fcitx.engines = with pkgs.fcitx-engines; [
    #     mozc
    #     chewing
    #     cloudpinyin
    #   ];
    #   enabled = "ibus";
    #   ibus.engines = with pkgs.ibus-engines; [
    #     libpinyin
    #     mozc
    #   ];
    # };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  programs = {
    gnome-terminal = {
      enable = true;
    };

    fish = {
      enable = true;
    };
  };
  
  environment = {
    variables = { EDITOR = "vim"; };
  
    systemPackages = with pkgs; [
      #Utilities
      wget
      vim
      git
      home-manager
      neofetch
      networkmanager
      gparted
      #dconf2nix - put back in after a new release

      #Apps
      firefox
      spotify
      teams
      libreoffice
      jetbrains.idea-ultimate
      jetbrains.clion
      vscode
      signal-desktop
      bitwarden
      # discord
      # steam
      
      #Desktop
      gnome3.gnome-tweaks
      gnome3.gnome-terminal
      gnome3.nautilus
      gnomeExtensions.appindicator
    ];
  };
  
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
  ];

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable sound and bluetooth.
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
    emacs = {
      enable = true;
    };
    
    openssh = {
      enable = true;
    };
      
    printing = {
      enable = true;
      drivers = [pkgs.gutenprint pkgs.gutenprintBin pkgs.hplip pkgs.hplipWithPlugin];
    };
      
    xserver = {
      enable = true;
      layout = "us";

      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;
    };

    gnome3 = {
      core-utilities.enable = false;
    };
      
    dbus.packages = [ pkgs.gnome3.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };

  users.users.michael = {
    shell = pkgs.fish;
    isNormalUser = true;
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
