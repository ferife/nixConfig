{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings.bind = ["$mainMod, R, submap, resize-window"];

      submaps.resize-window.settings = {
        binde = [
          ", right, resizeactive, 10 0" # Increase window width
          ", left, resizeactive, -10 0" # Decrease window width
          ", up, resizeactive, 0 -10" # Decrease window height
          ", down, resizeactive, 0 10" # Increase window height

          ", h, resizeactive, -10 0" # Decrease window width
          ", j, resizeactive, 0 10" # Increase window height
          ", k, resizeactive, 0 -10" # Decrease window height
          ", l, resizeactive, 10 0" # Increase window width
        ];

        bind = [
          ", escape, submap, reset"
        ];
      };
    };
  };
}
