{ config, lib, pkgs, ... }:
{
	options = {
		lsd.enable = lib.mkEnableOption "Installs & configures lsd, an improved version of the ls command with added features";
	};

	config = lib.mkIf config.lsd.enable {
		programs.lsd = {
      enable = true;
      enableAliases = true;
    };
	};
}
