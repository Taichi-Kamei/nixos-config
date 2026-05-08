{config, pkgs, inputs, split-monitor-workspaces, ...}:{
	home.username = "ta1";
	home.homeDirectory = "/home/ta1";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		zsh
		fastfetch
		btop
		librewolf
		ghostty
		adwaita-icon-theme
	];
	
	wayland.windowManager.hyprland = {
		enable = true;
		plugins = [
			# inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
			# split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
		];
		extraConfig = builtins.readFile ./hyprland.conf;
	};
}
