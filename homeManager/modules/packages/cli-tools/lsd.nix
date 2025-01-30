{ config, lib, pkgs, ... }:
{
	options = {
		lsdModule.enable = lib.mkEnableOption "Installs & configures lsd, an improved version of the ls command with added features";
	};

	config = lib.mkIf config.lsdModule.enable {
		programs.lsd = {
      enable = true;
      enableAliases = true;
    };
	};
}
