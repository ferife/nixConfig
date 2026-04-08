{inputs, ...}: {
  # flake.modules.nixos.zsh = {pkgs, ...}: {};

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
