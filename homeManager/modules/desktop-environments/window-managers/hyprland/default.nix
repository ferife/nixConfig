{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./options.nix

    ./settings
    ./hyprland.nix
  ];

  config.hm.wm.hyprland.enable = lib.mkIf (config.hm.wm.window-manager == "hyprland") config.hm.wm.enable;

  # TODO: Top bar components
  # Workspace indicator
  #   Pressing it should allow switching workspaces
  # App button
  #   Pressing it should open an app menu
  # Clock
  #   Should display current date and time (24hr format, include seconds)
  #   Pressing it should open a calendar view and current times in various important places
  #   Presssing the calendar view should open a calendar app
  #   Pressing the current times view should open a clock app
  # Weather
  #   Should show current temp and an icon for current weather
  #   Pressing it should show a forecast for the weather for the next few hours
  #   Pressing that forecast should open a weather app
  # System Monitor
  #   Shows current CPU usage & temp, RAM usage, upload & download speeds
  #   Pressing it should open an app with more detailed system monitor info
  # Clipboard button
  #   There should be a clipboard icon
  #   When pressed, it should open a widget with a clipboard history and the ability to pick a clipboard item and a button to clear the history
  # Power Menu
  #   There should be a button to open a power menu
  #   This button should include a volume slider, a brightness slider, and the following submenus
  #     A WiFi Menu
  #     A VPN status indicator
  #       Pressing it should open a VPN menu (open mullvad GUI)
  #     A Bluetooth menu
  #     A power mode indicator
  #       Pressing it should cycle through the power modes: Power saver, balanced, performance
  #       There should be a dropdown button that allows for selection and for opening a power settings application
  #     A night mode toggle (night mode means the filter that shows less blue light)
  #     An airplane mode toggle
  #     A toggle for the sleep timer (similar to GNOME caffeine)
  #     A button for power-off options, with the following options
  #       Shut down
  #       Hibernate
  #       Log off
  #     A button for initiating screenshots
  #     A button to open a settings app
}
