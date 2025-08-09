{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./cheese.nix
    ./calculator.nix
    ./clocks.nix
    ./loupe.nix
  ];

  hm = {
    cheese = lib.mkDefault true;
    gnome-calculator = lib.mkDefault true;
    gnome-clocks = lib.mkDefault true;
    loupe = lib.mkDefault true;
  };
  # The GUI used by GNOME for volume control is pavucontrol
}
