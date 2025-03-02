{ config, lib, ... }:
{
  imports = [
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

  gnome = {
    appsMenu.enable              = lib.mkDefault config.gnome.enable;
    autoMoveWindows.enable       = lib.mkDefault false;
    driveMenu.enable             = lib.mkDefault false;
    launchNewInstance.enable     = lib.mkDefault false;
    lightStyle.enable            = lib.mkDefault false;
    nativeWindowPlacement.enable = lib.mkDefault config.gnome.enable;
    placesMenu.enable            = lib.mkDefault config.gnome.enable;
    screenshotWindowSizer.enable = lib.mkDefault false;
    statusIcons.enable           = lib.mkDefault config.gnome.enable;
    systemMonitor.enable         = lib.mkDefault config.gnome.enable;
    userTheme.enable             = lib.mkDefault config.gnome.enable;
    windowList.enable            = lib.mkDefault false;
    windowsNavigator.enable      = lib.mkDefault config.gnome.enable;
    workspaceIndicator.enable    = lib.mkDefault false;
  };
}
