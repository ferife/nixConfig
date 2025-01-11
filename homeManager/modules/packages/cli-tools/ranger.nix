{ config, lib, pkgs, ... }:
{
	options = {
		rangerModule.enable = lib.mkEnableOption "Installs & configures ranger";
	};

	config = lib.mkIf config.rangerModule.enable {
		programs.ranger = {
      enable = true;
    };
	};
}
