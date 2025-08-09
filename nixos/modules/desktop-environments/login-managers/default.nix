{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    # ./gdm-25-05.nix
    ./gdm-unstable.nix
    ./regreet.nix
  ];

  config.nixos.login-manager = {
    name = "regreet";
  };
}
