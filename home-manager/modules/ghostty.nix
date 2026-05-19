{ config, pkgs, ... }: {

  programs.ghostty = {
	  enable = true;
	  settings = {
		  font-family = "JetBrainsMono Nerd Font";
		  font-size = 11.5;

		  background-opacity = 0.85;
		  theme = "Nord";
	  };
  };
}
