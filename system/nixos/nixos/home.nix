{ config, pkgs, ... }:

{
  home.username      = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion  = "25.11";

  imports = [
    ./config/helix.nix
    ./config/starship.nix
    ./config/wezterm.nix
  ];

  # niri
  home.file.".config/niri/config.kdl".source          = ./config/niri.kdl;
  home.file.".config/niri/wallpaper_script.sh".source = ./config/wallpaper_script.sh;
  home.file.".config/niri/wallpaper" = {
    source   = ./config/wallpaper;
    recursive = true;
  };

  #
  programs.bash = {
    enable = true;
    shellAliases = {
      collegarb = "sudo nix-collect-garbage -d";
      rebuild   = "sudo nixos-rebuild switch --flake .";
    };
  };

  # git
  programs.git = {
    enable    = true;
    userName  = "nilton-f-o-junior";
    userEmail = "nilton.f.o.junior@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase        = false;
    };
  };

  # ssh
  programs.ssh = {
    enable         = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname     = "github.com";
        user         = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  # pacotes
  home.packages = with pkgs; [
    # app
    swaybg
    rofi

    # rust
    cargo
    clippy
    gcc
    mdbook
    rustc
    rust-analyzer
    rustfmt

    # extensao
    marksman
  ];
}
