{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./astal-ags.nix
    ./hypridle.nix
    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.hyprland = {
    astal = lib.mkDefault config.hm.hyprland.enable;
    hypridle = lib.mkDefault config.hm.hyprland.enable;
    waybar = false;
    wofi = lib.mkDefault config.hm.hyprland.enable;
  };
}
