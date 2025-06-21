{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;
      systemd.enable = true;
      settings = {
        "$mainMod" = "SUPER";

        # Any monitors whose settings are not explicitly defined will be set up automatically
        "monitor" = ", preferred, auto, 1";
      };
    };

    wayland.windowManager.hyprland.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && !config.hm.gnome.enable) ["waybar"];
  };
  # TODO: Add Hyprpaper - Wallpaper manager
  # TODO: Add Dolphin - File manager
  # TODO: Add Hyprshot - Tool for taking screenshots
  #   Alternative to hyprshot: grim + slurp
  # TODO: Add Hyprlock - Hyprland lock screen
  # TODO: Add Hypridle - Program that configures what happens when computer sits idle
  # TODO: Add qt6.qtwayland - Dependency for any QT applications
}
