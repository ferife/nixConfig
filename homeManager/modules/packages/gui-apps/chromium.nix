{ config, lib, pkgs, inputs, ... }:
{
	options = {
		chromium.enable = lib.mkEnableOption "Installs & configures Firefox";
	};

	config = lib.mkIf config.chromium.enable {
    programs.chromium.enable = true;
	};
}
