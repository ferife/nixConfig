{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./waybarModules
  ];

  config = lib.mkIf config.hm.hyprland.waybar {
    stylix.targets.waybar = {
      enable = false;
      # enableLeftBackColors = true;
      # enableCenterBackColors = true;
      # enableRightBackColors = true;
    };
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          # font = "FiraCode Nerd Font Mono 16";
          layer = "top";
          position = "top";
          # mod = "dock";

          modules-left = [
            # "symbols"
            # "custom/weather"
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "tray"
            # "custom/language"
            "group/batteryGroup"
            # "backlight"
            # "pulseaudio"
            # "pulseaudio#microphone"
          ];
        };
      };

      # TODO: Add weather to waybar
      # TODO: Add power menu to waybar (power off, reboot, sleep)
      # TODO: Configure & style the workspaces, add a button to generate a workspace
      # TODO: Add a widget for the current status of my VPN
      # TODO: Add CPU usage, RAM usage, upload and download speed
      # TODO: Add general menu with the following options
      #   App launcher
      #   Keyboard state (caps lock)
      #   An idle inhibitor (like what I have in GNOME with Forge)

      style = ''${builtins.readFile ./waybar.css}'';
    };

    home.packages = with pkgs; [
      nerdfonts # Dependency for displaying symbols in the bar
      # WARNING: nerdfonts alone takes up 8GB of storage
    ];
    wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  };
}
