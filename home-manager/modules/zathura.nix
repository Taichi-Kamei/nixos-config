{ config, pkgs, ...}: {

  programs.zathura = {
    enable = true;
    options = {
      adjust-open  = "best";
      guioptions = "";
    };

    mappings = {
      i = "recolor";
      j = "feedkeys \"<C-Down>\"";
      k = "feedkeys \"<C-Up>\"";
    };
  };
}
