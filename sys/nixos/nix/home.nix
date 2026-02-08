# home

{ config, pkgs, ... }: 

{
	home.username = "user";
	home.homeDirectory = "/home/user";
	home.stateVersion = "25.11";

	programs.starship.enable = true;
		
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake .";
			collegarb = "sudo nix-collect-garbage -d";			
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
		# rust stack
		rustc
		cargo
		rustfmt
		clippy
		gcc

		# programs	
	  firefox
		helix
		starship
		swaybg
		rofi
	];
	
}
