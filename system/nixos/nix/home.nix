# home

{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.11";

  imports = [
    ./helix/helix.nix
    ./starship/starship.nix
    ./wezterm/wezterm.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      collegarb = "sudo nix-collect-garbage -d";
      rebuild = "sudo nixos-rebuild switch --flake .";
    };
  };

  programs.git = {
    enable = true;
    userName = "nilton-f-o-junior";
    userEmail = "nilton.f.o.junior@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  home.packages = with pkgs; [
    # applications
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

    # language serve
    marksman
  ];

}
