{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];

    initContent = ''
     if [[ "$TERM" != "linux" ]]; then
     if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
      source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
     fi
     fi
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      export TERMINAL=ghostty
      alias n="nvim"
      alias l="clear"
      alias rebuild="sudo nixos-rebuild switch --flake ~/nixos-config#Melon"

    '';
  };

  home.packages = with pkgs; [
    fzf
  ];
}
