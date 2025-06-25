{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.sway.enable {
    wayland.windowManager.sway.config = lib.mkMerge [
      # App Launcher
      (lib.mkIf (config.hm.wm.app-launcher == "rofi") {
        menu = "rofi -show drun";
      })
      (lib.mkIf (config.hm.wm.app-launcher == "wofi") {
        menu = "wofi --show drun --allow-images";
      })

      # Terminal
      (lib.mkIf (config.hm.specialArgs.user-settings.terminal == "ghostty") {
        terminal = "ghostty";
      })
      (lib.mkIf (config.hm.specialArgs.user-settings.terminal == "gnome-terminal") {
        terminal = "gnome-terminal";
      })
      (lib.mkIf (config.hm.specialArgs.user-settings.terminal == "kitty") {
        terminal = "kitty";
      })
    ];

    # wayland.windowManager.sway.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && !config.hm.gnome.enable) ["waybar"];
  };
}
