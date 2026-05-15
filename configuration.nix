{ config, inputs, lib, pkgs, ... }: {
  
  imports = [ 

    ./hardware-configuration.nix

    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Melon"; 

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  networking.wireless.iwd = {
  	enable = true;
	settings = {
		General = {
			EnableNetworkConfiguration = true;
			AddressRandomization = "network";	
		};

		Network = {
			EnableIPv6 = true;
		};
	};

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

  programs.hyprland.enable = true;
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
        restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };

    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
      enableVPN = true;                  # VPN management widget
      enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
      enableAudioWavelength = true;      # Audio visualizer (cava)
      enableCalendarEvents = true;       # Calendar integration (khal)
      enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  };

# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

# Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "caps:escape";

# Enable CUPS to print documents.
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;
  users.users.ta1 = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "input"]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
      tree
      ];
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;
  
  fonts = {
	  enableDefaultPackages = true;
	  packages = with pkgs; [
		  nerd-fonts.jetbrains-mono
		  jetbrains-mono
		  font-awesome 
		  noto-fonts-color-emoji
		  noto-fonts
		  noto-fonts-cjk-sans
	  ];

	  fontconfig = {
	  	defaultFonts = {
		  sansSerif = [ "Noto Sans" ];
		  serif = [ "Noto Serif" ];
		  monospace = [ "JetBrains Mono" ];
		};
	  };
  };

  nixpkgs.config.allowUnfree = true;


# Japanese Key Input
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
        fcitx5-gtk
    ];
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

  system.stateVersion = "25.11"; 

}

