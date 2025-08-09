{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    gnome-calculator = mkEnableOption "the GNOME calculator app";
  };
}
