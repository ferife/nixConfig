{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./hypridle.nix
    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.hyprland = {
    hypridle = lib.mkDefault config.hm.hyprland.enable;
    waybar = lib.mkDefault config.hm.hyprland.enable;
    wofi = lib.mkDefault config.hm.hyprland.enable;
  };
}
