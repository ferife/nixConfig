{ config, lib, ... }:
{
	options = {
		kitty.enable = lib.mkEnableOption "Installs & configures Kitty, the terminal emulator";
	};

	config = lib.mkIf config.kitty.enable {
		programs.kitty = {
      enable = true;
      shellIntegration.enableBashIntegration = true;
      settings = {
        background_opacity = lib.mkForce 0.9;
      };
    };
	};
}

# To search through command history in the terminal using stylix, simply use CTRL+R
