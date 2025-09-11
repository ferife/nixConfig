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
    gnome-terminal = mkEnableOption "the old GNOME terminal, which used to come pre-packaged with GNOME";
    loupe = mkEnableOption "Loupe, the default image viewer for GNOME";
  };
}
