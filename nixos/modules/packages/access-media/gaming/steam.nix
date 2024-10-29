

{ config, lib, pkgs, ... }:
{
	options = {
		steamModule.enable = lib.mkEnableOption "Installs & configures Steam";
	};

	config = lib.mkIf config.steamModule.enable {
		programs.steam = {
			enable = true;
		};
	};
}