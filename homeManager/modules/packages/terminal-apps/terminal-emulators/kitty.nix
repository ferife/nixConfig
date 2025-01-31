{ config, lib, pkgs, ... }:
{
	options = {
		kittyModule.enable = lib.mkEnableOption "Installs & configures Kitty, the terminal emulator";
	};

	config = lib.mkIf config.kittyModule.enable {
		programs.kitty = {
      enable = true;
      shellIntegration.enableBashIntegration = true;
    };
	};
}
