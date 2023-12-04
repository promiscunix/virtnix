{
  description = "A very basic flake";

  inputs = {
  	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  	home-manager = {
  	  url = "github:nix-community/home-manager";
  	  inputs.nixpkgs.follows = "nixpkgs";	
  	};
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linix";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
      	inherit system;
      	config = {
      	  allowUnfree = true;	
      	};
      };
      
    in
    {
    
    nixosConfigurations = {
      virtnix = nixpkgs.lib.nixosSystem {
      	specialArgs = { inherit inputs system; };

      	modules = [
      	  ./hosts/virtnix

      	  home-manager.nixosModules.home-manager
      	  {
      	  	home-manager.useGlobalPkgs = true;
      	  	home-manager.useUserPackages = true;
      	  	home-manager.users.gcis = import ./hosts/virtnix/home.nix;
      	  }
      	];
      };
    };
  };
}
