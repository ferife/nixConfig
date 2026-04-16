{inputs, ...}: {
  # zsh is a shell and command-line interpreter

  flake.modules.homeManager.zsh = {pkgs, ...}: {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;
    };
  };
}
