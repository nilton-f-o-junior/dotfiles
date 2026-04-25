Fiz a menor configuracão possivel para funcionar o noctalia shell

Basta copiar o flake.nix e home.nix, isso já vai fazer funcionar

flake.nix

```nix
# flake.nix
{
  description = "nixos";

  inputs = {
    nixpkgs.url          = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
  let
    system        = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit pkgs-unstable; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs       = true;
            useUserPackages     = true;
            backupFileExtension = "backup";
            extraSpecialArgs    = { inherit pkgs-unstable; };
            users.user          = import ./home.nix;
          };
        }
      ];
    };
  };
}
```

home.nix

```nix
{ config, pkgs, pkgs-unstable, ... }:

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
  # home.file.".config/niri/wallpaper_script.sh".source = ./config/wallpaper_script.sh;
  # home.file.".config/niri/wallpaper" = {
  #   source    = ./config/wallpaper;
  #   recursive = true;
  # };

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

    # noctalia
    pkgs-unstable.noctalia-shell
  ];
}
```

Temos que gerar os aquivos do noctalia se não vai da erro:

```bash
noctalia-shell
```

Depois disso já vamos ter todos os arquivos necessários, basta agora adicionar as linhas do seu sistema, seja ele hyperland, niri, sway ...

```kdl
// Iniciar noctalia ao abrir o niri
spawn-at-startup "noctalia-shell"

// Atalho para abrir/fechar o launcher (Mod+S por exemplo)
binds {
    Mod+S { spawn "noctalia-shell" "ipc" "call" "launcher" "toggle"; }
}
```
