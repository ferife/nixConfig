{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gdm.nix
    ./regreet.nix
  ];

  config.nixos.login-manager = {
    name = "regreet";
  };
}
