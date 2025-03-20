{
  config,
  lib,
  ...
}: {
  options.hm.stylix = with lib; {
    enable = mkEnableOption "stylix, a tool for ricing my NixOS system (AKA styling everything at once for a consistent appearance)";
    theme = mkOption {
      type = with types; uniq str;
      description = "Select a theme from the available options (currently only onedark)";
      default = "onedark";
      example = "onedark";
    };
  };
}
