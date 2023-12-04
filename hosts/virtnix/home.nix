{ inputs, config, pkgs, ... }:

{
	home.username = "gcis";
	home.homeDirectory = "/home/gcis";

    imports = [
      ../../modules/zsh
      ../../modules/starship
      ../../modules/micro
      ../../modules/git
    ];
    
	home.packages = [
	 pkgs.tree	
	];

	home.stateVersion = "23.05";
	programs.home-manager.enable = true;
}
