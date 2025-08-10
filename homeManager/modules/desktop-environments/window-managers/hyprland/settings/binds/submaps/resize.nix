{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland.extraConfig = let
      lines-array = builtins.concatStringsSep "\n" [
        "bind = $mainMod, R, submap, resize"
        "submap = resize"

        "binde = , right, resizeactive, 10 0" # Increase window width
        "binde = , left, resizeactive, -10 0" # Decrease window width
        "binde = , up, resizeactive, 0 -10" # Decrease window height
        "binde = , down, resizeactive, 0 10" # Increase window height

        "binde = , h, resizeactive, -10 0" # Decrease window width
        "binde = , j, resizeactive, 0 10" # Increase window height
        "binde = , k, resizeactive, 0 -10" # Decrease window height
        "binde = , l, resizeactive, 10 0" # Increase window width

        "bind = , catchall, submap, reset"
        "submap = reset"
      ];
    in "${lines-array}";
  };
}
