{ config, lib, pkgs, ... }:
{
	options = {
		thunderbirdModule.enable = lib.mkEnableOption "Installs & configures Thunderbird";
	};

	config = lib.mkIf config.thunderbirdModule.enable {
		programs.thunderbird = {
      enable = true;
    };
	};
}