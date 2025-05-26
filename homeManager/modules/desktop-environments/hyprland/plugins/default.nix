{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./hypridle.nix
    ./rofi.nix
    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.hyprland = {
    hypridle = lib.mkDefault config.hm.hyprland.enable;
    rofi = lib.mkDefault config.hm.hyprland.enable;
    waybar = lib.mkDefault config.hm.hyprland.enable;
    wofi = false;
  };
}
