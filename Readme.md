NixOS config files

Hyprland v0.55.0 with legacy hyprlang config files. 
May need to switch to the new lua config files if version upgrade is necessary.  
Hyprland plugins (split-monitor-workspace) require Hyprland to build from source, so it'll take a while to build on the first time. Whilst that happens, you can cook eggs for the dinner with the laptop.

A Quickshell called the Dank-Material-Shell (DMS) dynamically manages most of the visual setups.   
Handling the DMS monitor settings declaratively is a nightmare, so all the DMS related config are managed locally at ~/.config/hypr/dms.    
You shouldn't need to make or edit the dms directory as it gets auto-generated during nixos-rebuild, and all the settings can be done from the DMS settings GUI.

All nix files are in the home-manager/ directory.  
Other config files have their own directory.
