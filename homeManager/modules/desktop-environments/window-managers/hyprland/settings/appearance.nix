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
        decoration = {
          inactive_opacity = 0.8;
        };
      }
    ];
  };
}
