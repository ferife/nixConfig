{ config, lib, ... }:
{
  imports = [
    ./options.nix

    ./apps-menu.nix
    ./auto-move-windows.nix
    ./drive-menu.nix
    ./launch-new-instance.nix
    ./light-style.nix
    ./native-window-placement.nix
    ./places-menu.nix
    ./screenshot-window-sizer.nix
    ./status-icons.nix
    ./system-monitor.nix
    ./user-theme.nix
    ./window-list.nix
    ./windows-navigator.nix
    ./workspace-indicator.nix
  ];

  hm.gnome = {
    appsMenu              = lib.mkDefault config.hm.gnome.enable;
    autoMoveWindows       = lib.mkDefault false;
    driveMenu             = lib.mkDefault false;
    launchNewInstance     = lib.mkDefault false;
    lightStyle            = lib.mkDefault false;
    nativeWindowPlacement = lib.mkDefault config.hm.gnome.enable;
    placesMenu            = lib.mkDefault config.hm.gnome.enable;
    screenshotWindowSizer = lib.mkDefault false;
    statusIcons           = lib.mkDefault config.hm.gnome.enable;
    systemMonitor         = lib.mkDefault config.hm.gnome.enable;
    userTheme             = lib.mkDefault config.hm.gnome.enable;
    windowList            = lib.mkDefault false;
    windowsNavigator      = lib.mkDefault config.hm.gnome.enable;
    workspaceIndicator    = lib.mkDefault false;
  };
}
