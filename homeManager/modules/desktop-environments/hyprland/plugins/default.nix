{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./waybar.nix
  ];

  config.hm.hyprland = {
    waybar = lib.mkDefault config.hm.hyprland.enable;
  };
}
