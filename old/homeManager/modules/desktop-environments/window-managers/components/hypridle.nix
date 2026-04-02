{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.hypridle {
    services.hypridle = {
      enable = true;
      # settings = {};
    };
    wayland.windowManager.hyprland.settings.exec-once = ["hypridle"];
  };
}
