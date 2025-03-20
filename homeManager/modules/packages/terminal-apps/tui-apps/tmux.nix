{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.tmux {
    programs.tmux = {
      enable = true;
      mouse = true;
      keyMode = "vi"; # Enables Vim-style shortcuts
    };
  };
}
