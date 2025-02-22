{
  description = "A simple NixOS flake, very much inspired by ryan4yan's book";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        
        home-manager.nixosModules.home-manager {
	
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;

		home-manager.users.n5 = import ./home.nix;
	}
      ];
    };
  };
}
