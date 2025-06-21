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

  config.hm.hyprland = {
    dunst = lib.mkDefault config.hm.hyprland.enable;
    hypridle = lib.mkDefault config.hm.hyprland.enable;
    waybar = lib.mkDefault config.hm.hyprland.enable;

    # rofi
    # wofi
  };
}
