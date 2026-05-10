{config, pkgs, inputs, split-monitor-workspaces, ...}:{

  imports = [
     ./zsh.nix
     ./gtk.nix
     ./qt.nix
  ];

  home.username = "ta1";
  home.homeDirectory = "/home/ta1";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    
    git zsh tree tio

    nautilus btop blueman pavucontrol playerctl brightnessctl wireplumber iwgtk nwg-look wev

    wl-clipboard cliphist grim slurp

    firefox librewolf brave
    
    neovim tmux kitty ghostty vscode
    
    kicad syncthing obsidian

    waybar gucharmap rofi wlogout fastfetch swww waypaper
    hypridle hyprlock nwg-dock-hyprland adwaita-icon-theme

    spotify vesktop

    claude-code
  ];


  programs.ghostty = {

	  enable = true;
	  settings = {
		  font-family = "JetBrainsMono Nerd Font";
		  font-size = 11.5;

		  background-opacity = 0.85;
		  theme = "Nord";
	  };

  };


  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
  # inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };

  programs.hyprlock = {
	  enable = true;
	  extraConfig = builtins.readFile ./hypr/hyprlock.conf;
  };

  services.hypridle.enable = true;
  home.file.".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;

  programs.waybar = {
	enable = true;
	style = builtins.readFile ./waybar/style.css;
  };
  home.file.".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
  home.file.".config/waybar/frappe.css".source = ./waybar/frappe.css;

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
