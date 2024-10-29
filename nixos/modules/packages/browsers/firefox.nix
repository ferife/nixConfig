{ config, lib, pkgs, ... }:
{
	options = {
		firefoxModule.enable = lib.mkEnableOption "Installs & configures Firefox";
	};

	config = lib.mkIf config.firefoxModule.enable {
		programs.firefox = {
      enable = true;
    };
	};
}