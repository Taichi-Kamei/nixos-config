{config, pkgs, inputs, ...}: {

  imports = [
    ./modules/kitty.nix
    ./modules/ghostty.nix
    ./modules/alacritty.nix
    ./modules/qt.nix
    ./modules/gtk.nix
    ./modules/zsh.nix
    ./modules/tmux.nix
    ./modules/yazi.nix
    ./modules/zathura.nix
    ./modules/fastfetch.nix
    ./modules/nwg-dock-hyprland.nix
  ];

  home.username = "ta1";
  home.homeDirectory = "/home/ta1";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    
    git zsh tree tio quickshell woeusb 

    nautilus btop blueman pavucontrol playerctl brightnessctl
    wireplumber iwgtk nwg-look wev dgop upower bluez-tools

    wl-clipboard cliphist grim slurp imagemagick wtype zathura tdf 
    
    neovim tmux tmuxPlugins.rose-pine fzf fd poppler yazi tree-sitter
    kitty ghostty alacritty vscode 

    clang clang-tools cmake ninja rustup python3 uv vale typst nodejs
    esptool
    
    kicad syncthing obsidian 

    firefox librewolf brave
    
    waybar gucharmap rofi wlogout fastfetch awww waypaper matugen
    hypridle hyprlock nwg-dock-hyprland adwaita-icon-theme khal

    spotify vesktop discord slack

    claude-code gamescope

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

  home.file.".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;


  programs.neovim = {
	defaultEditor = true;
  };
  xdg.configFile."nvim".source = ./nvim;
  home.file.".vale.ini".source = ./nvim/vale.ini;


  programs.waybar = {
	enable = false;
	style = builtins.readFile ./waybar/style.css;
  };
  home.file.".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
  home.file.".config/waybar/frappe.css".source = ./waybar/frappe.css;

}
