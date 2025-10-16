{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland = lib.mkMerge [
      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "unstable") {
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
      })

      (lib.mkIf (config.hm.specialArgs.system-settings.nixpkgs == "25.05") {
        extraConfig = let
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

            "bind = , escape, submap, reset"
            "submap = reset"
          ];
        in "${lines-array}";
      })
    ];
  };
}
