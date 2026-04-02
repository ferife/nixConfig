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
    ./sddm.nix
  ];

  config.nixos.login-manager = {
    name = "regreet";
  };
}
