{config, pkgs, inputs, split-monitor-workspaces, ...}:{

  imports = [
     ./zsh.nix
     ./gtk.nix
     ./qt.nix
     ./nwg-dock-hyprland.nix
  ];

  home.username = "ta1";
  home.homeDirectory = "/home/ta1";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    
    git zsh tree tio quickshell 

    nautilus btop blueman pavucontrol playerctl brightnessctl wireplumber 
    iwgtk nwg-look wev dgop 

    wl-clipboard cliphist grim slurp wtype

    firefox librewolf brave
    
    neovim tmux fzf kitty ghostty alacritty vscode
    
    kicad syncthing obsidian slack

    waybar gucharmap rofi wlogout fastfetch awww waypaper matugen
    hypridle hyprlock nwg-dock-hyprland adwaita-icon-theme khal

    cbonsai cava sl asciiquarium-transparent

    spotify vesktop discord

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
    configType = "hyprlang";
    plugins = [
  # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
  # inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;

  };

    # source = ${config.home.homeDirectory}/.config/hypr/dms/binds.conf
  programs.hyprlock = {
	  enable = true;
	  extraConfig = builtins.readFile ./hypr/hyprlock.conf;
  };

  services.hypridle.enable = true;
  home.file.".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;

  programs.neovim = {
	defaultEditor = true;
  };
  xdg.configFile."nvim".source = ./nvim;

  programs.waybar = {
	enable = false;
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
