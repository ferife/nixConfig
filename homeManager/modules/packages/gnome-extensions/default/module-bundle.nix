

{ config, lib, pkgs, ... }:
{
  imports = [
    ./apps-menu.nix
    ./system-monitor.nix
  ];

  appsMenuModule.enable = lib.mkDefault true;
  systemMonitorModule.enable = lib.mkDefault true;

  
}