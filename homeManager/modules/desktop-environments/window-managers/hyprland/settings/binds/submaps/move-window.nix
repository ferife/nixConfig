{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings.bind = ["$mainMod SHIFT, M, submap, move-window"];

      submaps.move-window.settings = {
        binde = [
          ", H, swapwindow, l"
          ", J, swapwindow, d"
          ", K, swapwindow, u"
          ", L, swapwindow, r"

          ", left, swapwindow, l"
          ", down, swapwindow, d"
          ", up, swapwindow, u"
          ", right, swapwindow, r"
        ];

        bind = [
          ", escape, submap, reset"
        ];
      };
    };
  };
}
