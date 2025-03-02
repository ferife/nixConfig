{ config, lib, ... }:
{
	options = {
		chromium.enable = lib.mkEnableOption "Installs & configures Chromium";
	};

	config = lib.mkIf config.chromium.enable {
    programs.chromium.enable = true;
	};
}
