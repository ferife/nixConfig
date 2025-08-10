{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland.extraConfig = let
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

        "bind = , catchall, submap, reset"
        "submap = reset"
      ];
    in "${lines-array}";
  };
}
