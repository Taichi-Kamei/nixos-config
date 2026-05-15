{

  nixConfig = {
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    hyprland.url = "github:hyprwm/Hyprland/v0.55.0";

    hyprland-plugins = { 
      url = "github:hyprwm/hyprland-plugins"; 
      inputs.hyprland.follows = "hyprland";
    };

    split-monitor-workspaces = { 
      url = "github:zjeffer/split-monitor-workspaces"; 
      inputs.hyprland.follows = "hyprland";
      };

    # nixpkgs-kicad.url = "github:nixos/nixpkgs?ref=pull/518028/head";
	};

	outputs = { self, nixpkgs, home-manager, hyprland-plugins, split-monitor-workspaces, ... } @ inputs: {
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


