{ config, pkgs, ...}: {
  program.kitty = {

    enable = true;
    settings = {
      
      font_family = "JetBrainsMono Nerd Font";
      font_size = 11;
      background_opacity = "0.95";
    };
  };
}
