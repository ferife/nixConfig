{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.waybar {
    programs.waybar = {
      settings.mainBar = {
        "clock" = {
          format = " <span size=\"large\">  {:%H:%M:%S   󰃮 %a %d %b}</span> ";
          interval = 1;
          tooltip = true;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
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
    };
  };
}
