NixOS config files

Uses Hyprland v0.55.0 with legacy hyprlang config files. 
Might need to switch to the new lua config files if version upgrade is necessary.

Quickshell called Dank-Material-Shell (DMS) dynamically manages most of the visuals. 
Handling the DMS monitor settings declaratively is a nightmare, so all the DMS related config are managed locally at ~/.config/hypr/dms  

All nix files are in home-manager/modules/ directory.
Other file format config files have their own directory.
