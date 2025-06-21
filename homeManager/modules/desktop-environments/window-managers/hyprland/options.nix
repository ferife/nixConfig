{
  config,
  lib,
  pkgs,
  ...
}: {
  options.hm.hyprland = {
    enable = lib.mkEnableOption "Hyprland, the window manager";
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
