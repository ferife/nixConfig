{inputs, ...}: {
  # zellij is a terminal multiplexer
  #
  # flake.modules.nixos.zellij = {pkgs, ...}: {};

  flake.modules.homeManager.zellij = {pkgs, ...}: {
    programs.zellij = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      exitShellOnExit = true;
      attachExistingSession = true;
      settings.theme = "onedark";
    };
    stylix.targets.zellij.enable = false;
  };
}
