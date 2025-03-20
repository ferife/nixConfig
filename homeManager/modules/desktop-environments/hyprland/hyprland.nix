{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.enable {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;
      settings = {
        "$mainMod" = "SUPER";

        # Any monitors whose settings are not explicitly defined will be set up automatically
        "monitor" = ", preferred, auto, 1";
      };
    };
  };
}
# TODO: Add Hyprpaper - Wallpaper manager
# TODO: Add Dolphin - File manager
# TODO: Add Hyprshot - Tool for taking screenshots
# TODO: Add swaync - Notification daemon
#   May need to install library
# TODO: Add Hyprlock - Hyprland lock screen
# TODO: Add Hypridle - Program that configures what happens when computer sits idle

