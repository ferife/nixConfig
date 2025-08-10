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
          "hyprland/window" = {
            max-length = 40;
            rewrite = {
              "(.*) Ablaze Floorp" = "Floorp: $1";
            };
          };
        })
      ];
    };
  };
}
