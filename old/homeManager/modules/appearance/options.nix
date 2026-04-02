{
  config,
  lib,
  ...
}: {
  options.hm = {
    stylix = {
      enable = lib.mkEnableOption "stylix, a tool for ricing my NixOS system (AKA styling everything at once for a consistent appearance)";
      theme = lib.mkOption {
        type = lib.types.enum ["onedark"];
        description = "Select a color theme from the available options";
        default = "onedark";
        example = "onedark";
      };
    };
    wpaperd = lib.mkEnableOption "wpaperd, a wayland-based wallpaper daemon (supports compositors and KDE, not GNOME)";
  };
}
