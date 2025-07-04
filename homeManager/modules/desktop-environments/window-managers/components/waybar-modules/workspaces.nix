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
        # Hyprland
        (lib.mkIf (config.hm.wm.window-manager == "hyprland") {
          "hyprland/workspaces" = {
            all-outputs = true;
            active-only = false;
            # on-click = "activate";
            disable-scroll = false;
            on-scroll-up = "hyprctl dispatch workspace -1";
            on-scroll-down = "hyprctl dispatch workspace +1";
          };
        })

        # Sway
        # (lib.mkIf (config.hm.wm.window-manager == "sway") {})
      ];
    };
  };
}
