{ config, lib, pkgs, ... }:
{
	config = with lib; mkIf config.hm.stylix.enable {
    stylix = with lib; mkMerge [

      # General Settings
      { enable = true; }

      # Onedark
      (mkIf (config.hm.stylix.theme == "onedark") {
        image = ../../../generalResources/background-images/onedark/od_nixos_logo.png;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
        polarity = "dark";
      })
    ];
	};
}
