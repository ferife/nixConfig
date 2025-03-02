{ config, lib, pkgs, ... }:
{
	options = {
		gaming.steam.enable = lib.mkEnableOption "Installs & configures Steam";
	};

	config = lib.mkIf config.gaming.steam.enable {
		programs.steam = {
			enable = true;
		};
	};
}
