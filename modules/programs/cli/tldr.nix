{inputs, ...}: {
  # tldr is a tool showing examples of how to use any given command
  #
  # flake.modules.nixos.tldr = {pkgs, ...}: {};

  flake.modules.homeManager.tldr = {pkgs, ...}: {
    services.tldr-update.enable = true;
  };
}
