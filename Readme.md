NixOS config files

Hyprland v0.55.0 with legacy hyprlang config files. 
May need to switch to the new lua config files if version upgrade is necessary.

A Quickshell called the Dank-Material-Shell (DMS) dynamically manages most of the visual setups.   
Handling the DMS monitor settings declaratively is a nightmare, so all the DMS related config are managed locally at ~/.config/hypr/dms  

All nix files are in the home-manager/modules/ directory.  
Other config files have their own directory.
