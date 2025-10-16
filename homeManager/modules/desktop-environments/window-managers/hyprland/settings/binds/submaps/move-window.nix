{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = lib.mkMerge [
      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "unstable") {
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
      })

      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "25.05") {
        extraConfig = let
          lines-array = builtins.concatStringsSep "\n" [
            "bind = $mainMod SHIFT, M, submap, move"
            "submap = move"

            "binde = , left, swapwindow, l"
            "binde = , down, swapwindow, d"
            "binde = , up, swapwindow, u"
            "binde = , right, swapwindow, r"

            "binde = , H, swapwindow, l"
            "binde = , J, swapwindow, d"
            "binde = , K, swapwindow, u"
            "binde = , L, swapwindow, r"

            "bind = , escape, submap, reset"
            "submap = reset"
          ];
        in "${lines-array}";
      })
    ];
  };
}
