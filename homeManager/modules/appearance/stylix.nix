{ config, lib, pkgs, ... }:
{
	options = {
    stylix.hm = with lib; {
      enable = mkEnableOption "Enables & configures stylix, a tool for ricing my NixOS system (AKA styling everything at once for a consistent appearance)";
      theme = mkOption {
        type = with types; uniq str;
        description = "Select a theme from the available options (currently only onedark)";
        default = "onedark";
        example = "tokyo night moon";
      };
    };
	};

	config = with lib; mkIf config.stylix.hm.enable {
    stylix = with lib; mkMerge [

      # General Settings
      { enable = true; }

      # Onedark
      (mkIf (config.stylix.hm.theme == "onedark") {
        image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
        polarity = "dark";
      })
    ];
	};
}
