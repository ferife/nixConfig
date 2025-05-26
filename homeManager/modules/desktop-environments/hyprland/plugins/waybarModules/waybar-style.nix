{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.waybar {
    stylix.targets.waybar = {
      enableLeftBackColors = true;
      enableCenterBackColors = true;
      enableRightBackColors = true;
      addCss = true;
    };
  };
}
