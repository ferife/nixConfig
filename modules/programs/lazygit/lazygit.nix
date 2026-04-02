{inputs, ...}: {
  # flake.modules.nixos.lazygit = {pkgs, ...}: {};

  flake.modules.homeManager.lazygit = {pkgs, ...}: {
    imports = [inputs.self.modules.homeManager.git];

    programs.lazygit = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
