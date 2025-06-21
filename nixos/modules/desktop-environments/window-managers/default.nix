{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./hyprland
  ];

  config = {
    nixos.wm = {
      enable = true;
      window-manager = "hyprland";
    };

    environment.variables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
