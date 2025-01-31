{ config, lib, pkgs, inputs, ... }:
{
	options = {
		eclipseModule.enable = lib.mkEnableOption "Installs & configures Eclipse, an IDE made primarily for Java development";
	};

	config = lib.mkIf config.eclipseModule.enable {
		programs.eclipse = {
      enable = true;

    };
	};
}
