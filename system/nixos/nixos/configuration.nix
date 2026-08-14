#
{ config, lib, pkgs, ... }:

let
  pkgs-unstable = import <nixos-unstable> {
    config.allowUnfree = true;
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Tile WIndows Manager
  services.displayManager.ly.enable = true;
  programs.xwayland.enable = true;
  # programs.niri.enable = true;
  programs.niri = {
    enable = true;
    useNautilus = false;
  };


  # Wayland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ tree ];
  };


  # Set your time zone.
  time.timeZone = "America/Fortaleza";

  #
  i18n.defaultLocale = "en_US.UTF-8";

  #i18n.extraLocaleSettings = {
  #  LC_ADDRESS = "pt_BR.UTF-8";
  #  LC_IDENTIFICATION = "pt_BR.UTF-8";
  #  LC_MEASUREMENT = "pt_BR.UTF-8";
  #  LC_MONETARY = "pt_BR.UTF-8";
  #  LC_NAME = "pt_BR.UTF-8";
  #  LC_NUMERIC = "pt_BR.UTF-8";
  #  LC_PAPER = "pt_BR.UTF-8";
  #  LC_TELEPHONE = "pt_BR.UTF-8";
  #  LC_TIME = "pt_BR.UTF-8";
  #};


  # Networking
  networking.hostName = "nixos";
  networking.wireless.enable = true;
  networking.networkmanager.enable = true;


  # DNS
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.insertNameservers = ["1.1.1.1" "8.8.8.8"];


  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  # bash
  programs.bash = {
    enable = true;
    shellAliases = {
      collegarb = "sudo nix-collect-garbage -d";
      rebuild   = "sudo nixos-rebuild switch";
    };
  };

  programs.bash.interactiveShellInit = ''
    eval "$(starship init bash)"
  '';


  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
  };


  # Packages
  environment.systemPackages = with pkgs; [

    # Web Browsers & Communication
    firefox

    # Terminal Utilities & Shell Tools
    curl
    eza   
    fastfetch
    git
    wget

    # Editors & Terminal Emulators
    helix
    opencode
    starship
    wezterm

    # Graphics & Design
    krita

  ] ++ (with pkgs-unstable; [

    #
    noctalia

  ]);


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # List services that you want to enable:

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };


  # SSH
  services.openssh.enable = true;


  # Allow
  nixpkgs.config.allowUnfree = true;


  # Docker
  virtualisation.docker.enable = true;


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  system.stateVersion = "26.05";

}
