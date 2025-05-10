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
    waybar = false;
    wofi = lib.mkDefault config.hm.hyprland.enable;
  };
}
