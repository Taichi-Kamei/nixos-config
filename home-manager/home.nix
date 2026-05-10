{config, pkgs, inputs, split-monitor-workspaces, ...}:{

  imports = [
     ./zsh.nix

  ];
  home.username = "ta1";
  home.homeDirectory = "/home/ta1";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    
    git zsh tree tio

    nautilus btop blueman pavucontrol playerctl iwgtk nwg-look

    wl-clipboard cliphist

    firefox librewolf
    
    neovim tmux kitty ghostty vscode
    
    kicad syncthing obsidian

    waybar rofi wlogout fastfetch waypaper
    hypridle hyprlock nwg-dock-hyprland adwaita-icon-theme

    spotify vesktop

    claude
  ];


  programs.ghostty = {

	  enable = true;
	  settings = {
		  font-family = "JetBrainsMono Nerd Font";
		  font-size = 12;

		  background-opacity = 0.85;
		  background-blue = true;
		  theme = "Nord";
	  };

  };


  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
# inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
# split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
    ];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };

  programs.hyprlock = {
	  enable = true;
	  extraConfig = builtins.readFile ./hypr/hyprlock.conf;
  };

  services.hypridle = {
	  enable = true;
	  extraConfig = builtins.readFile ./hypr/hypridle.conf;
  };

  programs.waybar = {
	enable = true;
	style = builtins.readFile ./waybar/style.css;
	settings = builtins.fromJSON (builtins.readFile ./waybar/config.jsonc);
  };



  programs.fastfetch = {
	  enable = true;
	  settings = {
		  modules = [
			  "title"
				  "break"
				  "os"
				  "wm"
				  "kernel"
				  "cpu"
				  "break"
				  "uptime"
				  "memory"
				  "disk"
				  "break"
				  "colors"
		  ];
	  };
  };


}
