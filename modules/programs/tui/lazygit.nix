{inputs, ...}: {
  # lazygit is a terminal UI for git commands
  #
  # flake.modules.nixos.lazygit = {pkgs, ...}: {};

  flake.modules.homeManager.lazygit = {pkgs, ...}: {
    programs.git.enable = true;

    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    home.shellAliases.lg = "lazygit";
  };
}
