{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.enable {
    hm.hyprland.max-volume = 150;

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
    # TODO: Set up a way to raise/lower keyboard keys brightness
    #   brightnessctl set 0% --device="framework_laptop::kbd_backlight"
    #
    # TODO: Set up auto disable of mousepad when external mouse is connected
    #   Needs to use a udev rule
    #   If the currently active window manager/desktop environment is hyprland, then the environment variable XDG_SESSION_DESKTOP=hyprland
    #
    # NOTE: wearewaylandnow.com is a website listing many tools and packages that can be used for all sorts of things in wayland systems
  };
  # TODO: Add Hyprpaper - Wallpaper manager
  # TODO: Add Dolphin - File manager
  # TODO: Add Hyprshot - Tool for taking screenshots
  #   Alternative to hyprshot: grim + slurp
  # TODO: Add Hyprlock - Hyprland lock screen
  # TODO: Add Hypridle - Program that configures what happens when computer sits idle
  # TODO: Add qt6.qtwayland - Dependency for any QT applications
}
