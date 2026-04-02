{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.zsh {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;
    };
  };
}
