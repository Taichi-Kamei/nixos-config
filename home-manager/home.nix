{config, pkgs, inputs, ...}:{

  imports = [
    ./modules/kitty.nix
    ./modules/ghostty.nix
    ./modules/alacritty.nix
    ./modules/zsh.nix
    ./modules/gtk.nix
    ./modules/qt.nix
    ./modules/tmux.nix
    ./modules/zathura.nix
    ./modules/fastfetch.nix
    ./modules/nwg-dock-hyprland.nix
  ];

  home.username = "ta1";
  home.homeDirectory = "/home/ta1";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    
    git zsh tree tio quickshell 

    kdePackages.dolphin nautilus btop blueman pavucontrol playerctl brightnessctl
    wireplumber iwgtk nwg-look wev dgop upower

    wl-clipboard cliphist grim slurp wtype zathura tdf 
    
    neovim tmux tmuxPlugins.rose-pine fzf fd yazi
    kitty ghostty alacritty vscode 

    clang clang-tools rustup python3 uv typst nodejs
    
    kicad syncthing obsidian 

    firefox librewolf brave
    
    waybar gucharmap rofi wlogout fastfetch awww waypaper matugen
    hypridle hyprlock nwg-dock-hyprland adwaita-icon-theme khal

    spotify vesktop discord slack

    claude-code

    cbonsai cmatrix cava sl asciiquarium-transparent
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
    ];
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };


  xdg.configFile."hypr/dms".source = ./hypr/dms;
  

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

}
