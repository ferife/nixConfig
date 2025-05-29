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
        "pulseaudio" = {
          format = " {volume}% {icon}";
          format-muted = " 󰝟 ";
          format-icons = {
            default = ["󰕿 " "󰖀 " "󰕾 "];
          };
          on-click = "pavucontrol";
          tooltip = true;
        };
      };
      # style = ''${builtins.readFile ./pulseaudio.css}'';
    };
  };
}
