{ config, lib, pkgs, ... }:
{
	options = {
		kittyModule.enable = lib.mkEnableOption "Installs & configures Kitty, the terminal emulator";
	};

	config = lib.mkIf config.kittyModule.enable {
		programs.kitty = {
      enable = true;

      font = {
        name = "Fira Code";
        size = 10;
      };
      
      shellIntegration.enableBashIntegration = true;
    };
	};
}
