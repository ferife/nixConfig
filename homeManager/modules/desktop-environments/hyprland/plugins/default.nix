{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./eww.nix
    ./hypridle.nix
    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.hyprland = {
    eww = lib.mkDefault config.hm.hyprland.enable;
    hypridle = lib.mkDefault config.hm.hyprland.enable;
    waybar = lib.mkDefault config.hm.hyprland.enable;
    wofi = lib.mkDefault config.hm.hyprland.enable;
  };
}
