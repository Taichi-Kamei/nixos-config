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

# Set your time zone.
  time.timeZone = "America/Chicago";
  # time.timeZone = "America/Vancouver";

  nix.settings.experimental-features = [ "flakes" "nix-command" ];


# Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  programs.hyprland.enable = true;


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

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
      curl
      zip
      unzip
      usbutils
  ];

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

