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
          format = "  {:%H:%M:%S   󰃮 %a %d %b}";
          interval = 1;
          tooltip = true;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          # TODO: Style tooltips to match the general aesthetic
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "left";
            # format = {
            #   months = "<span color='#000000'><b>{}</b></span>";
            #   days = "<span color='#000000'><b>{}</b></span>";
            #   weeks = "<span color='#000000'><b>{}</b></span>";
            #   weekdays = "<span color='#000000'><b>{}</b></span>";
            #   today = "<span color='#000000'><b>{}</b></span>";
            # };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-sroll-down = "shift_down";
            on-click-middle = "shift_reset";
          };
        };
      };
      # style = ''${builtins.readFile ./clock.css}'';
    };
  };
}
