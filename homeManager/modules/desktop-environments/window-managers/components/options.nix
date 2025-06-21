{
  config,
  lib,
  pkgs,
  ...
}: {
  # options.hm.hyprland = {
  #   dunst = lib.mkEnableOption "Dunst, a notification daemon";
  #   hypridle = lib.mkEnableOption "Hypridle, Hyprland's official idle daemon, which handles what happens when the computer sits idle for an extended period of time";
  #   rofi = lib.mkEnableOption "Rofi-Wayland, an app launcher for wayland window managers";
  #   waybar = lib.mkEnableOption "Waybar, a highly customizable status bar for wayland window managers";
  #   wofi = lib.mkEnableOption "Wofi, an app launcher for wayland window managers";
  # };
  options.hm.wm.components = {
    dunst = lib.mkEnableOption "Dunst, a notification daemon";
    hypridle = lib.mkEnableOption "Hypridle, Hyprland's official idle daemon, which handles what happens when the computer sits idle for an extended period of time";
    rofi = lib.mkEnableOption "Rofi-Wayland, an app launcher for wayland window managers";
    waybar = lib.mkEnableOption "Waybar, a highly customizable status bar for wayland window managers";
    wofi = lib.mkEnableOption "Wofi, an app launcher for wayland window managers";
  };
}
