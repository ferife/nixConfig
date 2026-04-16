{inputs, ...}: {
  # zellij is a terminal multiplexer

  flake.modules.homeManager.zellij = {pkgs, ...}: {
    programs.zellij = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      exitShellOnExit = true;
      attachExistingSession = true;
    };
  };
}
