# NixOS configuration
{ config, lib, pkgs, ... }:

let
  pkgs-unstable = import <nixos-unstable> {
    config.allowUnfree = true;
  };

in

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Habilita suporte a Flakes e nix-command para o builtins.getFlake funcionar
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Tiling Window Manager
  # services.displayManager.ly.enable = true;
  programs.xwayland.enable = true;
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


  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };


  # User account. Don't forget to set a password with ‘passwd’.
  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ tree ];
  };


  # Time zone
  time.timeZone = "America/Fortaleza";


  # Locale
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
  networking.networkmanager.enable = true;


  # DNS (managed through NetworkManager)
  networking.networkmanager.insertNameservers = [ "1.1.1.1" "8.8.8.8" ];


  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];


  # Shell
  programs.bash = {
    enable = true;
    shellAliases = {
      collegarb = "sudo nix-collect-garbage -d";
      rebuild   = "sudo nixos-rebuild switch";
    };
  };


  # Terminal
  programs.starship.enable = true;


  # Wayland
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "niri";
  };


  # Packages
  environment.systemPackages = with pkgs; [

    # Web Browsers & Communication
    firefox

    # Terminal Utilities & Shell Tools
    curl
    git
    helix
    wget

    # Terminal Emulators
    wezterm

  ] ++ (with pkgs-unstable; [

    # Desktop
    noctalia

    # Terminal
    fresh-editor
    opencode

  ]);


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;


  # Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };


  # SSH
  services.openssh.enable = true;


  # Allow unfree packages (needed for google-chrome)
  nixpkgs.config.allowUnfree = true;


  # Docker
  virtualisation.docker.enable = true;


  # Network proxy (if necessary)
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  system.stateVersion = "26.05";

}
