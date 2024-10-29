{ config, lib, pkgs, ... }:
{
	options = {
		inputRemapperModule.enable = lib.mkEnableOption "Installs & configures Input Remapper";
	};

	config = lib.mkIf config.openrazerModule.enable {
		services.input-remapper = {
      enable = true;
    };
	};
}