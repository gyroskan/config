# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./computers/zephyrus.nix
      ./desktops/i3.nix
      ./programs/nodejs.nix
      ./programs/vscode.nix
      ./programs/jetbrains.nix
      ./programs/office.nix
      ./users/gyroskan.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.networkmanager.enable = true;
  networking.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "fr_FR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the Plasma 5 Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  

  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    blueman.enable = true;

    xserver = {
      enable = true;
      # Configure keymap in X11
      layout = "us";
      xkbOptions = "eurosign:e";

      # Enable touchpad support (enabled default in most desktopManager).
      libinput.enable = true;
    };
  };

  # Enable docker service
  virtualisation.docker.enable = true; 

  # Enable sound.
  sound.enable = true;

  hardware = {
    pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  # Enable zsh
  programs = {
    zsh.enable = true;
    steam.enable = true;
  };
  
  # Allow licences for specifics packages
  nixpkgs.config.allowUnfree = true;

  # HACK: this is needed to be able to compile with external libs such as
  # criterion  | readline 
  environment.pathsToLink = [ "/include" "/lib" ];
  environment.extraOutputsToInstall = [ "out" "lib" "bin" "dev" ];
  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
    NIX_CFLAGS_COMPILE_x86_64_unknown_linux_gnu = "-I/run/current-system/sw/include";
    NIX_CFLAGS_LINK_x86_64_unknown_linux_gnu = "-L/run/current-system/sw/lib";
    PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # put gcc in first to get use as cc                                         
    gcc                                                                         

    # C libraries
    criterion
    readline 

    # Shell utilities
    bat
    bash
    colordiff
    curl
    dash
    fd
    file
    findutils
    git
    gzip
    gtop
    htop
    keychain
    killall
    man-db
    man-pages
    mdcat
    patchelf
    neofetch
    screen
    sshfs
    shellcheck
    vim
    wget
    unzip
    xclip
    zip
    zsh

    # Pdf reader
    pdfpc

    # Dev basics
    autoconf
    automake
    binutils
    bison
    clang
    clang-tools
    cmake
    docker
    doxygen
    flex
    gdb
    gnumake
    insomnia
    meson
    ninja
    python3
    valgrind

    # Others
    discord
    dunst
    feh
    firefox
    gparted
    imagemagick
    pavucontrol
    rofi
    thunderbird
    tree
    vlc

    # At the end so all the libraries installed are taken into account
    pkg-config
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

