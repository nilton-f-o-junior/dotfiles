# config

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Host 
  networking.hostName = "nixos";


  # Configure network
  networking.networkmanager.enable = true;


  # Set your time zone
  time.timeZone = "America/Recife";


  # Configure network
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Select internationalisation properties
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  # Display
  services.displayManager.ly.enable = true;
  programs.niri.enable = true;	


  # Wayland
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
     config.common.default = "gtk";
  };


  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  

  # Enable sound
  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };


  # Define a user account
  users.users.user = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
  };


  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
     alacritty
     git
     vim
     xwayland
     wget
  ];


  # Fonts
  fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
  ];


  # Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

 
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;


  # Git
  programs.git.enable = true;
  

  # Allow
  nixpkgs.config.allowUnfree = true;
  
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "25.11";

}
