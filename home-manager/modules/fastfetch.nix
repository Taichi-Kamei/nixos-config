{ config, pkgs, ...}: {

  programs.fastfetch = {
	  enable = true;
	  settings = {
      logo = "NixOS";

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
