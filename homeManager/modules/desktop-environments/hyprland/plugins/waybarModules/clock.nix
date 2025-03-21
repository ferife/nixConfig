{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.waybar {
    programs.waybar = {
      settings.mainBar = {
        "clock" = {
          format = "  {:%H:%M   󰃮 %a %d %b}";
          interval = 1;
        };
      };
    };
  };
}
