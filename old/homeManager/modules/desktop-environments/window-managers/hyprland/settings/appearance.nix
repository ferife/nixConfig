{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [
      {
        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration.inactive_opacity = 0.85;
      }

      (lib.mkIf (config.hm.wm.components.noctalia.enable) {
        general = {
          gaps_in = 5;
          gaps_out = 10;
        };

        decoration = {
          rounding = 20;
          rounding_power = 2;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
          };

          # blur = {
          #   enabled = true;
          #   size = 3;
          #   passes = 2;
          #   vibrancy = 0.1696;
          # };
        };
      })
    ];
  };
}
