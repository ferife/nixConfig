{ config, lib, pkgs, ... }:
{
	options = {
		libreofficeModule.enable = lib.mkEnableOption "Installs & configures LibreOffice";
	};

	config = lib.mkIf config.libreofficeModule.enable {
		environment.systemPackages = with pkgs; [
      libreoffice
    ];
	};
}