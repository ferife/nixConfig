{ config, lib, pkgs, ... }:
{
	options = {
		gaming.inputRemapper.enable = lib.mkEnableOption "Installs & configures Input Remapper";
	};

	config = lib.mkIf config.gaming.inputRemapper.enable {
		services.input-remapper = {
      enable = true;
    };
	};
}
