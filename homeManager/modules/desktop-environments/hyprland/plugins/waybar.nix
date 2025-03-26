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
            # "tray"
            # "custom/language"
            "group/battery-group"
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
      # TODO: Add general menu with the following options (use group module drawer function)
      #   App launcher
      #   Keyboard state (caps lock)
      #   Volume control (PulseAudio slider)

      # TODO: Use the native idle_inhibitor module
      # This will, by itself and with no need for any external program, inhibit idle behavior

      style = let
        declarations = rec {
          colors = config.lib.stylix.colors.withHashtag;
          variables = builtins.concatStringsSep "\n  " [
            "--base00: ${colors.base00};"
            "--base01: ${colors.base01};"
            "--base02: ${colors.base02};"
            "--base03: ${colors.base03};"
            "--base04: ${colors.base04};"
            "--base05: ${colors.base05};"
            "--base06: ${colors.base06};"
            "--base07: ${colors.base07};"
            "--base08: ${colors.base08};"
            "--base09: ${colors.base09};"
            "--base0A: ${colors.base0A};"
            "--base0B: ${colors.base0B};"
            "--base0C: ${colors.base0C};"
            "--base0D: ${colors.base0D};"
            "--base0E: ${colors.base0E};"
            "--base0F: ${colors.base0F};"
          ];
          final = ":root {\n  ${variables}\n}";
        };
      in
        lib.mkBefore "/* ${declarations.final} */\n\n${builtins.readFile ./waybar.css}";
    };

    home.packages = with pkgs; [
      nerdfonts # Dependency for displaying symbols in the bar
      # WARNING: nerdfonts alone takes up 8GB of storage
    ];
    wayland.windowManager.hyprland.settings.exec-once = ["waybar"];
  };
}
