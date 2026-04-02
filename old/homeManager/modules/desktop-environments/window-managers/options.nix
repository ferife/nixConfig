{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.wm = {
    enable = lib.mkEnableOption "a window manager";
    window-manager = lib.mkOption {
      type = lib.types.enum ["hyprland"];
      description = "The main window manager to use";
    };
    app-launcher = lib.mkOption {
      type = lib.types.enum ["rofi" "wofi"];
      description = "The main app/script menu for this system";
    };
    max-volume = lib.mkOption {
      type = lib.types.ints.between 0 150;
      description = "Maximum volume the system will allow";
      default = 100;
    };
  };
}
