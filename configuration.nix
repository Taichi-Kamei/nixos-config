{ config, inputs, lib, pkgs, ... }: {
  
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModprobeConfig = ''
    options psmouse synaptics_intertouch=1
    '';
  networking.hostName = "Melon"; 

  networking.wireless.iwd.enable = true;
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # time.timeZone = "America/Chicago";
  time.timeZone = "America/Vancouver";

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  
  environment.systemPackages = with pkgs; [
      wget
      curl
      zip
      unzip
      usbutils
      psmisc
  ];

  users.users.ta1 = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "input"]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
      tree
      ];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             
      restartIfChanged = true;   
    };

    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = false;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
    
  };

  services.upower.enable = true;

# Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.bluetooth.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  programs.zsh.enable = true;
  programs.firefox.enable = true;
  
  fonts = {
	  enableDefaultPackages = true;
	  packages = with pkgs; [
		  noto-fonts
      nerd-fonts.jetbrains-mono
		  font-awesome 
		  noto-fonts-color-emoji
		  noto-fonts-cjk-sans
	  ];
  };

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

# Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

# Japanese Key Input
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
# networking.firewall.allowedUDPPorts = [ ... ];

#  nix.gc = {
#    automatic = true;
#    dates = "weekly";
#    options = "--delete-older-than 5d";
#  };

  system.stateVersion = "25.11"; 
}

