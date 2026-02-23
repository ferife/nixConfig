{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [
      {general.gaps_out = 5;}
    ];
  };
}
