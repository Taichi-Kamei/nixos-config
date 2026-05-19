{ config, pkgs, ... }: {
  programs.alacritty = {

    enable = true;

    settings = {
      window = {
        padding = { x = 10; y = 10;};
        decorations = "none";
        opacity = 0.80;
      };

      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 11.5;
      };
    };
  };
}
