{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.sway.enable {
    # hint Electron apps to use Wayland
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.sway = {
      enable = true;
      config = lib.mkMerge [
        (lib.mkIf (config.hm.wm.app-launcher == "rofi") {menu = "rofi";})
        (lib.mkIf (config.hm.wm.app-launcher == "wofi") {menu = "wofi";})
      ];
    };

    # wayland.windowManager.sway.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && !config.hm.gnome.enable) ["waybar"];
  };
}
