{ config, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    baseIndex = 1;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      resurrect
      sensible
      continuum
      yank
      vim-tmux-navigator
      {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'moon'
          set -g @rose_pine_directory 'on'
          set -g @rose_pine_show_pane_directory 'off'
          set -g @rose_pine_bar_bg_disable 'on'
          set -g @rose_pine_bar_bg_disabled_color_option 'default'
          set -g @rose_pine_left_separator ' 🠰 '
          set -g @rose_pine_right_separator ' 🠪 '
          set -g @rose_pine_field_separator '  '
          set -g @rose_pine_window_separator ' - '
          set -g @rose_pine_window_status_separator "  "
          set -g @rose_pine_session_icon '  '
          set -g @rose_pine_current_window_icon '  ' 
          set -g @rose_pine_folder_icon '  ' 
          set -g @rose_pine_username_icon '  '
          set -g @rose_pine_hostname_icon ' 󰒋 ' 
          set -g @rose_pine_date_time_icon ' 󰃰 ' 
        '';
      }
    ];

    extraConfig = ''
      unbind C-b
      bind C-a send-prefix
      unbind %
      unbind '"'
      bind '\' split-window -h
      bind ']' split-window -v
      bind '[' kill-pane
      bind r source-file ~/.tmux.conf \; display "Config reloaded"
    '';
  };
}
