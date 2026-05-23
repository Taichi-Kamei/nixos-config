{ config, pkgs, ... }: {

  programs.ghostty = {
	  enable = true;
	  settings = {
      gtk-single-instance = true;
		  font-family = "JetBrainsMono Nerd Font";
		  font-size = 11.5;

		  background-opacity = 0.85;
		  theme = "Nord";
	  };
  };
}
