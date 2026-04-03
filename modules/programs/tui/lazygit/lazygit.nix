{inputs, ...}: {
  # flake.modules.nixos.lazygit = {pkgs, ...}: {};

  flake.modules.homeManager.lazygit = {pkgs, ...}: {
    programs.git.enable = true;

    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
