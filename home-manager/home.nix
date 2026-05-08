{config, pkgs, inputs, split-monitor-workspaces, ...}:{
	home.username = "ta1";
	home.homeDirectory = "/home/ta1";
	home.stateVersion = "25.11";

	home.packages = with pkgs; [
		git
		zsh
		tree
		tio
		nautilus
		btop
		blueman
		playerctl
		firefox
		librewolf
		obsidian
		vscode
		neovim
		kitty
		ghostty
		kicad
		syncthing
		rofi
		iwgtk
		nwg-look
		pavucontrol
		wlogout
		fastfetch
		waypaper
		hypridle
		hyprlock
		nwg-dock-hyprland
		adwaita-icon-theme
		spotify
		vesktop
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
