{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.wm.hyprland.enable {
    wayland.windowManager.hyprland.settings = lib.mkMerge [
      {input.touchpad.disable_while_typing = true;}
    ];
  };
}
