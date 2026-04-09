{inputs, ...}: {
  # fzf is a fuzzy finder
  #
  # flake.modules.nixos.fzf = {pkgs, ...}: {};

  flake.modules.homeManager.fzf = {pkgs, ...}: {
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
