{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    programs.waybar = {
      settings.mainBar = lib.mkMerge [
        (lib.mkIf (config.hm.wm.window-manager == "hyprland") {
          "hyprland/submap" = {
            format = " Submap: {} ";
            on-click = "hyprctl dispatch submap reset"; # TODO: Go back to default map
          };
        })
      ];
    };
  };
}
