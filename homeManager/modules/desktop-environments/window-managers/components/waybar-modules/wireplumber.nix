{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    hm.scripts.modify-volume.enable = true;

    home.packages = [pkgs.pavucontrol];

    programs.waybar = {
      settings.mainBar = {
        "wireplumber" = {
          format = " {volume}% {icon}";
          format-muted = " {volume}% 󰝟 ";
          format-icons = {
            default = ["󰕿 " "󰖀 " "󰕾 "];
          };
          on-click = "pavucontrol";
          tooltip = true;
          tooltip-format = "{node_name}\nWirePlumber";
          on-scroll-up = "exec ${config.hm.scripts.modify-volume.full-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.wm.max-volume} 1%+";
          on-scroll-down = "exec ${config.hm.scripts.modify-volume.full-path} @DEFAULT_AUDIO_SINK@ ${toString config.hm.wm.max-volume} 1%-";
        };
      };
    };
  };
}
