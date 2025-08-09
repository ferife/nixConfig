{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./calculator.nix
  ];

  hm = {
    gnome-calculator = lib.mkDefault true;
  };
}
