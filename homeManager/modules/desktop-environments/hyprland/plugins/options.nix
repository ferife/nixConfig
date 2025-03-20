{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.hyprland = {
    hypridle = lib.mkEnableOption "Hypridle, Hyprland's official idle daemon, which handles what happens when the computer sits idle for an extended period of time";
    waybar = lib.mkEnableOption "Waybar, a highly customizable status bar for wayland window managers";
    wofi = lib.mkEnableOption "Wofi, an app launcher for wayland window managers";
  };
}
