{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixos.wm = {
    enable = lib.mkEnableOption "a window manager";
    window-manager = lib.mkOption {
      type = lib.types.enum ["hyprland" "sway"];
      description = "The main window manager to use";
    };
  };
}
