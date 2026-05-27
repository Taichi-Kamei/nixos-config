{config, pkgs, ...}: {

  programs.yazi = {

    enable = true;

    settings = {
      
      opener = {
        edit = [{ run = ''nvim "$@"''; block = true; desc = "nvim"}; ];
        pdf = [{ run = ''tdf "$@"''; block = true; desc = "tdf";}];
      };

      open.rules = [
        { mime = "application/pdf"; use = "pdf"; }
        { mime = "text/*"; use = "edit"; }
        { mime = "*"; use = "open"; }
      ];
    };

    keymap = {
      
      manager.keymap = [
        { on = "<C-p>"; run = ''shell tmux send-keys -t:.1 ":e $0\n"''; desc = "Open in nvim pane";}
        { on = "P";     run = ''shell zathura "$@"''; desc = "Open in zathura"; }
      ];
    };


  };




}
