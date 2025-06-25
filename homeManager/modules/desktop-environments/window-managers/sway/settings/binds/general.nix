{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.sway.enable {
    wayland.windowManager.sway = {
      config = {
        modifier = "Mod4"; # Mod1 is alt key, Mod4 is super key
        keybindings = let
          mod = config.wayland.windowManager.sway.config.modifier;
        in
          lib.mkOptionDefault {
            "${mod}+a" = "exec ${config.wayland.windowManager.sway.config.menu}";
            "${mod}+d" = "focus parent";
          };
      };
    };

    # wayland.windowManager.sway.settings.exec-once = lib.mkIf (config.hm.wm.components.waybar && !config.hm.gnome.enable) ["waybar"];
  };
}
