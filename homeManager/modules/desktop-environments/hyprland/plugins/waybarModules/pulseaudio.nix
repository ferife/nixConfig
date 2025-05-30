{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.waybar {
    home.packages = [pkgs.pavucontrol];
    programs.waybar = {
      settings.mainBar = {
        "pulseaudio" = {
          format = " {volume}% {icon}";
          format-muted = " {volume}% 󰝟 ";
          format-icons = {
            default = ["󰕿 " "󰖀 " "󰕾 "];
          };
          on-click = "pavucontrol";
          tooltip = true;
          max-volume = config.hm.hyprland.max-volume;
        };
      };
      # style = ''${builtins.readFile ./pulseaudio.css}'';
    };
  };
}
