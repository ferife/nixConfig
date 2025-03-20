{ config, lib, pkgs, inputs, ... }:
{
  config = lib.mkIf config.hm.hyprland.enable {

    home.sessionVariables.NIXOS_OZONE_WL = "1";
    # hint Electron apps to use Wayland

    wayland.windowManager.hyprland = {
      # allow home manager to configure hyprland
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, T, exec, kitty"
          "$mainMod, F, exec, firefox"
          # TODO: make the specific terminal and browser depend on userSettings
        ];

        # Any monitors whose settings are not explicitly defined will be set up automatically
        "monitor" = ", preferred, auto, 1";
      };
    };

  };
}
# TODO: Add wofi - App Launcher

# TODO: Add Hyprpaper - Wallpaper manager

# TODO: Add Dolphin - File manager

# TODO: Add Hyprshot - Tool for taking screenshots

# TODO: Add swaync - Notification daemon
  # May need to install library

# TODO: Add Hyprlock - Hyprland lock screen

# TODO: Add Hypridle - Program that configures what happens when computer sits idle
