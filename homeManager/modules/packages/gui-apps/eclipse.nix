{ config, lib, ... }:
{
	options = {
		eclipse.enable = lib.mkEnableOption "Installs & configures Eclipse, an IDE made primarily for Java development";
	};

	config = lib.mkIf config.eclipse.enable {
		programs.eclipse = {
      enable = true;
    };
	};
}
