{inputs, ...}: {
  # flake.modules.nixos.git = {pkgs, ...}: {};

  flake.modules.homeManager.git = {pkgs, ...}: {
    programs.git = {
      enable = true;
      signing.format = "openpgp";
      settings.user = {
        email = "github.backtrack434@passmail.net";
        name = "Fernando";
      };
    };
  };
}
