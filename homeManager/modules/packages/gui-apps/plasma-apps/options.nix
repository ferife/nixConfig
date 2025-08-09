{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  options.hm = with lib; {
    dolphin = mkEnableOption "Dolphin, the default file manager for KDE Plasma";
  };
}
