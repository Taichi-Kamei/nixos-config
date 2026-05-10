{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# hyprland-plugins = {
		# 	url = "github:hyprwm/hyprland-plugins";
		# };

		# split-monitor-workspaces = {
		#      		url = "github:zjeffer/split-monitor-workspaces";
		#   		};
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
				nixosConfigurations.Melon = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./configuration.nix
					home-manager.nixosModules.home-manager
					{
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.extraSpecialArgs = { inherit inputs ; };
						home-manager.users.ta1 = import ./home-manager/home.nix;
					}
				];
		};
	};

}


