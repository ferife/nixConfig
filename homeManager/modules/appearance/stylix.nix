{ config, lib, pkgs, ... }:
{
	options = {
		stylixHmModule.enable = lib.mkEnableOption "Enables & configures stylix, a tool for ricing my NixOS system (AKA styling everything at once for a consistent appearance)";
	};

  # To search through command history in the terminal using stylix, simply use CTRL+R

	config = lib.mkIf config.stylixHmModule.enable {
		stylix = {
      enable = true;
      image = ./background-images/onedark/od_space02.png;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
      polarity = "dark";
    };
	};
}
