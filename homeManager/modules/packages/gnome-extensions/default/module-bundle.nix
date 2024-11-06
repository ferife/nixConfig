

{ config, lib, pkgs, ... }:
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

  appsMenuModule.enable = lib.mkDefault true;
  autoMoveWindowsModule.enable = lib.mkDefault false;
  driveMenuModule.enable = lib.mkDefault false;
  launchNewInstanceModule.enable = lib.mkDefault false;
  lightStyleModule.enable = lib.mkDefault false;
  nativeWindowPlacementModule.enable = lib.mkDefault true;
  placesMenuModule.enable = lib.mkDefault true;
  screenshotWindowSizerModule.enable = lib.mkDefault false;
  statusIconsModule.enable = lib.mkDefault true;
  systemMonitorModule.enable = lib.mkDefault true;
  userThemeModule.enable = lib.mkDefault false;
  windowListModule.enable = lib.mkDefault false;
  windowsNavigatorModule.enable = lib.mkDefault true;
  workspaceIndicatorModule.enable = lib.mkDefault false;
}