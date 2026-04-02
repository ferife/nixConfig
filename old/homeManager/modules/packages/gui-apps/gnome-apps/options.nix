{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    cheese = mkEnableOption "Cheese, the default camera application packaged with GNOME";
    gnome-calculator = mkEnableOption "the GNOME calculator app";
    gnome-clocks = mkEnableOption "the GNOME clocks app";
    gnome-console = mkEnableOption "the current default GNOME console";
    gnome-terminal = mkEnableOption "the old GNOME terminal, which used to come pre-packaged with GNOME";
    loupe = mkEnableOption "Loupe, the default image viewer for GNOME";
    nautilus = mkEnableOption "Nautilus, the default file browser for GNOME";
  };
}
