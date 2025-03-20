{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.hyprland = {
    waybar = lib.mkDefault config.hm.hyprland.enable;
    wofi = lib.mkDefault config.hm.hyprland.enable;
  };
}
