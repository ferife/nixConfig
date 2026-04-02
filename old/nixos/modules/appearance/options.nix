{
  config,
  lib,
  ...
}: {
  options.nixos.stylix = with lib; {
    enable = mkEnableOption "stylix, a tool for ricing my NixOS system (AKA styling everything at once for a consistent appearance)";
    theme = lib.mkOption {
      type = lib.types.enum ["onedark"];
      description = "Color scheme to use universally for the system";
      default = "onedark";
      example = "onedark";
    };
  };
}
