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
          # TODO: Clock Tooltip
          # TODO: Style tooltips to match the general aesthetic
        };
      };
      style = ''${builtins.readFile ./clock.css}'';
    };
  };
}
