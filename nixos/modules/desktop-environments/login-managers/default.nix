{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./gdm.nix
  ];

  config.nixos.login-manager = {
    name = "gdm";
  };
}
