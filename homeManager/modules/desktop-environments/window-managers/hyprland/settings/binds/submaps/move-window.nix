{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings.bindd = ["$mainMod SHIFT, M, Submap: move-window, submap, move-window"];

      submaps.move-window.settings = {
        bindde = [
          ", H, swap windows leftwards, swapwindow, l"
          ", J, swap windows downwards, swapwindow, d"
          ", K, swap windows upwards, swapwindow, u"
          ", L, swap windows rightwards, swapwindow, r"

          ", left, swap windows leftwards, swapwindow, l"
          ", down, swap windows downwards, swapwindow, d"
          ", up, swap windows upwards, swapwindow, u"
          ", right, swap windows rightwards, swapwindow, r"
        ];
      };
    };
  };
}
