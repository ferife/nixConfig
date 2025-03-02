{ config, lib, pkgs, ... }:
{
	options = {
		libreoffice.enable = lib.mkEnableOption "Installs & configures LibreOffice";
	};

	config = lib.mkIf config.libreoffice.enable {
		home.packages = with pkgs; [
      libreoffice
    ];
	};
}
