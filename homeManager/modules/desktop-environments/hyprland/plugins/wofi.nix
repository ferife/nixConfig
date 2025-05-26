{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.wofi {
    programs.wofi = {
      enable = true;
      # settings = {};
    };
  };
  # TODO: Things to see if I can do with this
  # Create a power options menu to access with waybar
}
