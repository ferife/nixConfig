{
  config,
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}: {
  imports = [
    ./waybarModules
  ];

  config = lib.mkIf config.hm.hyprland.waybar {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
        enableDebug = true;
        enableInspect = true;
      };
      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            "idle_inhibitor"
            "group/battery-group"
            "group/power-group"
          ];
        };
      };

      # TODO: Add weather to waybar
      # TODO: Add power menu to waybar (power off, reboot, sleep, log out)
      # TODO: Configure & style the workspaces, add a button to generate a workspace
      # TODO: Add a widget for the current status of my VPN
      # TODO: Add CPU usage, RAM usage, upload and download speed
      # TODO: Add general menu with the following options (use group module drawer function)
      #   backlight (screen brightness)
      #   App launcher
      #   Keyboard state (caps lock)
      #   Volume control (PulseAudio slider)
      # Add a module that displays any currently playing audio (use the MPRIS module)
    };

    home.packages = [
      userSettings.fontPkg
    ];
    # wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  };
}
