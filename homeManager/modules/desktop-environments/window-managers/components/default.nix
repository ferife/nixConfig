{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./dunst.nix
    ./hypridle.nix
    ./rofi.nix
    ./waybar.nix
    ./wofi.nix
  ];

  config.hm.wm.components = {
    dunst = lib.mkDefault config.hm.wm.hyprland.enable;
    hypridle = lib.mkDefault config.hm.wm.hyprland.enable;
    waybar = lib.mkDefault config.hm.wm.hyprland.enable;

    # rofi
    # wofi
  };
}
