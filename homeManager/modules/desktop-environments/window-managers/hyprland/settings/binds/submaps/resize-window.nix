{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings.bindd = ["$mainMod, R, Submap: resize-window, submap, resize-window"];

      submaps.resize-window.settings = {
        bindde = [
          ", right, Increase window width, resizeactive, 10 0"
          ", left, Decrease window width, resizeactive, -10 0"
          ", up, Decrease window height, resizeactive, 0 -10"
          ", down, Increase window height, resizeactive, 0 10"

          ", H, Decrease window width, resizeactive, -10 0"
          ", J, Increase window height, resizeactive, 0 10"
          ", K, Decrease window height, resizeactive, 0 -10"
          ", L, Increase window width, resizeactive, 10 0"
        ];
      };
    };
  };
}
