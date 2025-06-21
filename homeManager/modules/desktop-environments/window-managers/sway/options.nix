{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.wm.sway.enable = lib.mkEnableOption "Sway, the window manager";
}
